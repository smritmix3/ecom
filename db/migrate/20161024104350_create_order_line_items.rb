class CreateOrderLineItems < ActiveRecord::Migration
  def change
    create_table :order_line_items do |t|
      t.integer :product_id
      t.integer :price
      t.integer :quantity, default:1
      t.integer :user_id
      t.integer :order_id
      t.timestamps
    end
  end
end
