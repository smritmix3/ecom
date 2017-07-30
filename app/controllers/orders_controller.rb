class OrdersController < ApplicationController
def index
	 @orders= current_user.orders
	end

	def create
		@order = Order.new
	    @order.order_date= Date.today
	    @order.order_number = "GSSS-IS-#{Random.rand(1000..5000)}"
	    @order.user_id = current_user.id 
	    @order.total = current_user.line_items.sum(:price)
	    @order.confirmation = true
	    @order.save

	    line_items = current_user.line_items
	    line_items.each do |li|
	     oli = OrderLineItem.new
	     oli.order_id = @order.id 
	     oli.product_id = li.product_id
	     oli.price = li.price
	     oli.quantity = li.quantity
	     oli.save
	     end
	     current_user.line_items.delete_all
	     redirect_to "/orders", notice: "Order has been successfully created"
	     end	
end
