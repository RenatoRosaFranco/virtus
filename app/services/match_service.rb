# frozen_string_literal: true

class MatchService
  def self.call(user_preferences)
    new(user_preferences).call
  end

  def initialize(user_preferences)
    @preferences = user_preferences
  end

  def call
    find_best_matches
  end

  def find_best_matches
    matches = TherapySession.where(user_id: nil)

    matches = filter_by_price_range(matches)
    matches = filter_by_therapist_age_range(matches)
    matches = filter_by_schedule(matches)

    sort_by_best_fit(matches)
  end

  private

  def filter_by_price_range(matches)
    price_range = @preferences[:price_range]
    matches.where(price: price_range)
  end

  def filter_by_therapist_age_range(matches)
    age_range = @preferences[:therapist_age_range]
    matches.joins(:therapist).where(users: { age: age_range })
  end

  def filter_by_schedule(matches)
    schedule_preference = @preferences[:schedule]
    matches.select { |session| session.fits_schedule?(schedule_preference) }
  end

  def sort_by_best_fit(matches)
    matches.sort_by { |match| -score_match(match) }
  end

  def score_match(match)
    score = 0
    score += 1 if match.price.in?(@preferences[:price_range])
    score += 1 if match.therapist.age.in?(@preferences[:therapist_age_range])
    score += 1 if match.fits_schedule?(@preferences[:schedule])
  end
end
