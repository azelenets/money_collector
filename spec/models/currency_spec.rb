describe Currency do
  describe 'ActiveModel validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:code) }
  end

  describe 'ActiveRecord associations' do
    it { expect(subject).to have_and_belong_to_many(:countries) }
  end
end