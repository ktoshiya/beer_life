class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true

      t.text :content
      t.integer :amount
      t.integer :rating
      t.date :drink_date

      t.timestamps
    end
  end
end
