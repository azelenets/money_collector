# == Schema Information
#
# Table name: currencies
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  collected  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

describe Currency do
  subject(:currency) { create(:currency) }

  describe 'ActiveModel validations' do
    it { expect(currency).to validate_presence_of(:name) }
    it { expect(currency).to validate_presence_of(:code) }
    it { expect(currency).to validate_uniqueness_of(:code) }
  end

  describe 'ActiveRecord associations' do
    it { expect(currency).to have_and_belong_to_many(:countries) }
  end

  describe 'ActiveRecord model methods' do
    it { expect(currency).to respond_to(:collect!) }
    it '#collect! should change visited attribute' do
      expect{ currency.collect! }.to change{ currency.collected }.from(false).to(true)
    end
  end
end
