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
  describe 'ActiveModel validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:code) }
    it { expect(subject).to validate_uniqueness_of(:name) }
    it { expect(subject).to validate_uniqueness_of(:code) }
  end

  describe 'ActiveRecord associations' do
    it { expect(subject).to have_and_belong_to_many(:countries) }
  end
end
