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
require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
