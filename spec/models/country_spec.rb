# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  visited    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

describe Country do
  subject(:country) { create(:country) }

  describe 'ActiveModel validations' do
    it { expect(country).to validate_presence_of(:name) }
    it { expect(country).to validate_presence_of(:code) }
    it { expect(country).to validate_uniqueness_of(:name) }
    it { expect(country).to validate_uniqueness_of(:code) }
  end

  describe 'ActiveRecord associations' do
    it { expect(country).to have_and_belong_to_many(:currencies) }
    it { expect(country).to have_and_belong_to_many(:trips) }
  end

  describe 'ActiveRecord model methods' do
    it { expect(country).to respond_to(:visit!) }
    it '#visit! should change visited attribute' do
      expect{ country.visit! }.to change{ country.visited }.from(false).to(true)
    end
  end
end
