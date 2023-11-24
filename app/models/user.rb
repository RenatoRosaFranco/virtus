# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Enum
  enum role: [:user, :psychologist, :company]

  # Callbacks
  before_create :generate_referral_code

  after_create :create_address
  after_create :create_profile, if: -> { user? or psychologist? }
  after_create :create_company_page, if: -> { company? }

  # Relationships
  has_and_belongs_to_many :specialties
  has_and_belongs_to_many :approaches

  has_one  :address
  has_many :favorites
  has_many :psychologists, through: :favorites

  has_many :received_ratings, class_name: 'Rating', foreign_key: 'psychologist_id', dependent: :destroy
  has_many :given_ratings,    class_name: 'Rating', foreign_key: 'user_id', dependent: :destroy

  has_many :therapist_sessions, class_name: 'TherapySession', foreign_key: 'therapist_id', dependent: :destroy
  has_many :patient_sessions,   class_name: 'TherapySession', foreign_key: 'patient_id',   dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :payments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :referral_code, uniqueness: true

  # Generate referral code
  def generate_referral_code
    self.referral_code = SecureRandom.hex(6)
  end

  # Average rating
  def average_rating
    ratings.average(:score).to_f.round(2)
  end
end
