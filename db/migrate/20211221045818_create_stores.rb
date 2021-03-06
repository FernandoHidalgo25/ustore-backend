class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :url
      t.float :lat
      t.float :long
      t.string :image_url
      t.string :address
      t.string :kind_of_shop
      t.integer :zip_code
      t.string :yelp_id

      t.timestamps
    end
  end
end
