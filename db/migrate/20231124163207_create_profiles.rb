# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table   :profiles do |t|
      t.string     :name
      t.date       :birthdate
      t.string     :document
      t.integer    :gender
      t.string     :phone_prefix
      t.string     :phone_number
      t.string     :source_of_discovery
      t.boolean    :terms
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
