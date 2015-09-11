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
  describe 'ActiveModel validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:code) }
    it { expect(subject).to validate_uniqueness_of(:name) }
    it { expect(subject).to validate_uniqueness_of(:code) }
  end

  describe 'ActiveRecord associations' do
    it { expect(subject).to have_and_belong_to_many(:currencies) }
    it { expect(subject).to have_and_belong_to_many(:trips) }
  end
end
