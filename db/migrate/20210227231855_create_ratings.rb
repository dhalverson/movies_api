class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.string :user_id
      t.float :rating
      t.datetime :timestamp
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
