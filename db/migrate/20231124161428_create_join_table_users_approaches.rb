# frozen_string_literal: true

class CreateJoinTableUsersApproaches < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :approaches do |t|
      t.index [:user_id, :approach_id]
      t.index [:approach_id, :user_id]
    end
  end
end
