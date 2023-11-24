# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id                 :integer          not null, primary key
#  content            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  therapy_session_id :integer
#  user_id            :integer
#
# Indexes
#
#  index_messages_on_therapy_session_id  (therapy_session_id)
#  index_messages_on_user_id             (user_id)
#
class Message < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :therapy_session
end
