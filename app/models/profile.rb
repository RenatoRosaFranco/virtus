# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  birthdate           :date
#  document            :string
#  gender              :integer
#  name                :string
#  phone_number        :string
#  phone_prefix        :string
#  source_of_discovery :string
#  terms               :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  # Relationships
  belongs_to :user
end
