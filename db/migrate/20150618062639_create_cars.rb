class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :car_id
      t.integer :year
      t.string :make
      t.string :model
      t.string :model_sentiment
      t.string :make_sentiment
      t.string :model_positive
      t.string :model_negative
      t.string :features
      t.timestamps null: false
    end
  end
end
