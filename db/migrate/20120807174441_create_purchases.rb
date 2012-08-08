class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :count
      t.decimal :price
      t.integer :purchaser_id
      t.integer :item_id
      t.integer :import_id

      t.timestamps
    end
  end
end
