class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true

      t.string :beer_name, null: false
      t.text :content, null: false
      t.integer :count, null: false
      t.integer :rating, null: false
      t.date :drink_date, null: false

      t.timestamps
    end
  end
end
