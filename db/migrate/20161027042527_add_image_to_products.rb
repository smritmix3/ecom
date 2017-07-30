class AddImageToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :image_url, :string, default: "/images/default.jpg"
  end
end
