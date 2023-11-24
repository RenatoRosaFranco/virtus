class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :psychologist_id
      t.integer :user_id
      t.string :score
      t.integer :attention
      t.integer :environment
      t.integer :punctuality
      t.text :comments

      t.timestamps
    end
  end
end
