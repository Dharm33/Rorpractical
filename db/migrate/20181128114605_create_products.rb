class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    	t.string :name
        t.decimal :price
        t.string :quantity
        t.string :product_image
        t.string :product_image_gallery
        t.references :category, foreign_key: :true
      t.timestamps
    end
  end
end
