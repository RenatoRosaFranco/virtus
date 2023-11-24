# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  acronym    :string
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class State < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged]

  # Scopes
  scope :capital, -> { cities.where(capital: true).first }

  # Relationships
  has_many :cities, dependent: :destroy

  # Validates
  validates :name, presence: true
end
