# frozen_string_literal: true

class CreateTherapySessions < ActiveRecord::Migration[5.2]
  def change
    create_table :therapy_sessions do |t|
      t.integer  :therapist_id
      t.integer  :patient_id
      t.datetime :start_time
      t.datetime :end_time
      t.string   :status

      t.timestamps
    end
  end
end
