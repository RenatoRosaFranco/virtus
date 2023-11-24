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
class Rating < ApplicationRecord
  RANGE_SCORE_LIMIT = (1..5)

  # Relationships
  belongs_to :psychologist, class_name: 'User', foreign_key: 'psychologist_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  # Validations
  validates :score, :attention, :punctuality, :environment, presence: true
  validate :validate_ratings

  # Validate ratings
  def validate_ratings
    %i(score attention punctuality environment).each do |attribute|
      value = send(attribute)

      unless RANGE_SCORE_LIMIT.include?(value)
        errors.add(attribute, I18n.t('errors.messages.out_of_range'), range: RANGE_SCORE_LIMIT)
      end
    end
  end
end
