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

class Country < ActiveRecord::Base
  # Scopes
  scope :not_visited, -> { where(visited: false) }
  scope :visited, -> { where(visited: true) }

  # Associations
  has_and_belongs_to_many :currencies

  def visit
    update!(visited: true)
  end
end
