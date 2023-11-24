# == Schema Information
#
# Table name: favorites
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  psychologist_id :integer
#  user_id         :integer
#
class Favorite < ApplicationRecord
  # Relationships
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :psychologist, class_name: 'User', foreign_key: 'psychologist_id'

  # Validations
  validates :user_id, uniqueness: { scope: :psychologist_id }
end
