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

describe Trip do
  describe 'ActiveModel validations' do
    it { expect(subject).to validate_presence_of(:description) }
    it { expect(subject).to validate_presence_of(:end_date) }
  end

  describe 'ActiveRecord associations' do
    it { expect(subject).to have_and_belong_to_many(:countries) }
    it { expect(subject).to have_many(:currencies).through(:countries) }
  end
end
