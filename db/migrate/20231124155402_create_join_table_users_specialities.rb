# frozen_string_literal: true

class CreateJoinTableUsersSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :specialties do |t|
      t.index [:user_id, :specialty_id]
      t.index [:specialty_id, :user_id]
    end
  end
end
