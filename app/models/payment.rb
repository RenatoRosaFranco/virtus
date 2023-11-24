# frozen_string_literal: true

# == Schema Information
#
# Table name: payments
#
#  id                 :integer          not null, primary key
#  amount             :decimal(, )
#  status             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  therapy_session_id :integer
#  user_id            :integer
#
# Indexes
#
#  index_payments_on_therapy_session_id  (therapy_session_id)
#  index_payments_on_user_id             (user_id)
#
class Payment < ApplicationRecord
  # Enum
  enum status: {
    pending:   'Pending',
    completed: 'Completed',
    refunded:  'Refunded',
    failed:    'Failed'
  }

  # Relationships
  belongs_to :user
  belongs_to :therapy_session
end
