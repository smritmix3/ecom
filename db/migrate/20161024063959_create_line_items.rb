class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :product_id
      t.integer :price
      t.integer :quantity, default: 1
      t.integer :user_id
      t.timestamps
    end
  end
end
