# == Schema Information
#
# Table name: ratings
#
#  id              :integer          not null, primary key
#  attention       :integer
#  comments        :text
#  environment     :integer
#  punctuality     :integer
#  score           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  psychologist_id :integer
#  user_id         :integer
#
require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
