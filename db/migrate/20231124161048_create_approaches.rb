# frozen_string_literal: true

class CreateApproaches < ActiveRecord::Migration[5.2]
  def change
    create_table :approaches do |t|
      t.string :name

      t.timestamps
    end
  end
end
