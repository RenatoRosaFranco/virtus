# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table   :payments do |t|
      t.decimal    :amount
      t.references :user, foreign_key: true
      t.references :therapy_session, foreign_key: true

      t.timestamps
    end
  end
end
