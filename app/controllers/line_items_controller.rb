class LineItemsController < ApplicationController
def index
	 @line_items = current_user.line_items
	end
	def destroy
		@line_item = LineItem.find(params[:id])
		@line_item.destroy
		redirect_to :back, notice: "successfully removed from cart"
	end
def add
	@product = Product.find(params[:product_id])
    line_item = LineItem.new
    line_item.product_id = @product.id 
    line_item.user_id = current_user.id 
    line_item.price = @product.price
    line_item.save
    
    redirect_to :back, notice: "added product to cart" 
end
end