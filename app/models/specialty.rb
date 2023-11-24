# frozen_string_literal: true

# == Schema Information
#
# Table name: specialties
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Specialty < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged]

  # Relationships
  has_and_belongs_to_many :users

  # Validations
  validates :name, presence: true
end
