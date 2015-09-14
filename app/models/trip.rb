# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  description :text
#  end_date    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Trip < ActiveRecord::Base
  scope :finished, -> { includes(:countries).where(countries: { visited: true }) }
  scope :unfinished, -> { includes(:countries).where(countries: { visited: false }) }

  # Associations
  has_and_belongs_to_many :countries
  has_many :currencies, through: :countries

  #Validations
  validate :require_at_least_one_country
  validates :description, presence: true
  validates :end_date, presence: true

  def finish!
    countries.map{ |country| country.visit! }
  end

  def finished?
    countries.all?{ |country| country.visited? }
  end

  private

  def require_at_least_one_country
    if country_ids.empty? && countries.count == 0
      errors.add(:base, 'Please select at least one country')
    end
  end
end
