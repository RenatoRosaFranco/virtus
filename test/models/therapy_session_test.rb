# == Schema Information
#
# Table name: therapy_sessions
#
#  id           :integer          not null, primary key
#  end_time     :datetime
#  start_time   :datetime
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  patient_id   :integer
#  therapist_id :integer
#
require 'test_helper'

class TherapySessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
