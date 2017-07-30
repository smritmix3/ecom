class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
     t.string :name
     t.integer :price
     t.text :description
     t.integer :category_id #foreign key     
      t.timestamps
    end
  end
end
