require 'savon'

# [
# :get_country_by_country_code,
# :get_isd,
# :get_countries,
# :get_currency_code_by_currency_name,
# :get_iso_country_code_by_county_name,
# :get_currency_code,
# :get_country_by_currency_code,
# :get_currencies,
# :get_currency_by_country,
# :get_gm_tby_country
# ]
class LoadDataWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, backtrace: true

  def perform(*params)
    parser, client = Nori.new, Savon.client(wsdl: 'http://www.webservicex.net/country.asmx?WSDL')
    response = client.call(:get_currencies)
    get_currency_code_parsed = parser.parse(response.body[:get_currencies_response][:get_currencies_result])
    get_currency_code_parsed['NewDataSet']['Table'].each do |data|
      unless data['Currency'].blank?
        country = Country.find_or_create_by!(name: data['Name'], code: data['CountryCode'])
        currency = Currency.find_by(code: data['CurrencyCode'])
        unless currency.present?
          currency = Currency.create!(name: data['Currency'], code: data['CurrencyCode'])
        end
        unless country.currencies.find_by(code: currency.code).present?
          country.currencies << currency
          country.save!
        end
      end
    end
  end
end