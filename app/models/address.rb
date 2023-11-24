# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  address      :string
#  complement   :string
#  neighborhood :string
#  number       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  city_id      :integer
#  state_id     :integer
#  user_id      :integer
#
# Indexes
#
#  index_addresses_on_city_id   (city_id)
#  index_addresses_on_state_id  (state_id)
#  index_addresses_on_user_id   (user_id)
#
class Address < ApplicationRecord

  # Validates
  validates :address, presence: true
  validates :number, presence: true
  validates :complement, presence: true
  validates :neighborhood, presence: true

  # Relationships
  belongs_to :city
  belongs_to :state
  belongs_to :user
end
