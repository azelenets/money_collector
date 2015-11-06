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
  subject(:trip) { create(:trip) }

  describe 'ActiveModel validations' do
    it { expect(trip).to validate_presence_of(:description) }
    it { expect(trip).to validate_presence_of(:end_date) }
    it { expect(trip).to require_at_least_one_country }
  end

  describe 'ActiveRecord associations' do
    it { expect(trip).to have_and_belong_to_many(:countries) }
    it { expect(trip).to have_many(:currencies).through(:countries) }
  end

  describe 'ActiveRecord model methods' do
    it { expect(trip).to respond_to(:finish!) }
    it { expect(trip).to respond_to(:finished?) }
    it '#finish! should visit all countries' do
      expect{ trip.finish! }.to change{ trip.finished? }.from(false).to(true)
    end
  end
end
