class CreateOpinion < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :opinion_id
      t.string :opinion_tweet
      t.string :opinion_strength
      t.string :opinion_type
      t.timestamps null: false
    end
  end
end
