class CreateBeerImages < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_images do |t|
      t.belongs_to :beer, index: true
        
      t.string :image_name, null: false
  
      t.timestamps
    end
  end
end
