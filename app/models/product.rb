class Product < ActiveRecord::Base
	has_many :reviews
	belongs_to :category
	has_many :line_items
validates_presence_of :name
validates_uniqueness_of :name
end
