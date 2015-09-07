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

class Currency < ActiveRecord::Base
  # Scopes
  scope :not_collected, -> { where(collected: false) }
  scope :collected, -> { where(collected: true) }

  # Associations
  has_and_belongs_to_many :countries
end
