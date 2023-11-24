# frozen_string_literal: true

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
class TherapySession < ApplicationRecord
  # Enum
  enum status: {
    scheduled:   'Scheduled',
    in_progress: 'In Progress',
    completed:   'Completed'
  }

  # Scope
  scope :unfinished, -> { where.not(status: :completed) }

  # Relationships
  belongs_to :therapist, class_name: 'User'
  belongs_to :patient,   class_name: 'User'

  has_many :messages, dependent: :destroy
  has_many :payments, dependent: :destroy

  # Check if time slot is available?
  def self.is_time_slot_available?(therapist_id, start_time)
    !where(therapist_id: therapist_id, start_time: start_time).unfinished.exists?
  end

  # Check if session fits a given schedule preference
  def fits_schedule(schedule_preference)
    case schedule_preference
    when 'morning'   then start_time.hour.between?(6, 11)
    when 'afternoon' then start_time.hour.between?(12, 17)
    when 'evening'   then start_time.hour.between?(18, 23)
    when 'night'     then start_time.hour.between?(0, 5)
    else
      true
    end
  end
end
