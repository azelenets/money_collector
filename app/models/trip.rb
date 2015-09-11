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
  # Associations
  has_and_belongs_to_many :countries
  has_many :currencies, through: :countries

  #Validations
  validates :description, presence: true
  validates :end_date, presence: true

  def finish!
    countries.map{ |country| country.visit! }
  end

  def finished?
    countries.all?{ |country| country.visited? }
  end
end
