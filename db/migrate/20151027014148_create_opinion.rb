class CreateOpinion < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :opinion_id
      t.integer :year
      t.string :make
      t.string :model
      t.float :model_sentiment
      t.float :make_sentiment
      t.string :model_positive
      t.string :model_negative
      t.string :features
      t.timestamps null: false
    end
  end
end
