class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_is_admin, except: [:index, :show]
  def index
  @products=Product.order('price DESC')
  end
  def new
   	@product=Product.new
end
def create
	 @product=Product.new(params[:product].permit(:name, :price, :description, :category_id))
	 if @product.save
	 	redirect_to "/products",notice: "successfully created category"
	 else
	 	render action: "new"
	 	
end
end
def show
	  @product = Product.find(params[:id])
	  @products = Product.all
	  end
	  def edit
	  @product = Product.find(params[:id])
	end

def update
	 @product = Product.find(params[:id])
	 if @product.update_attributes(params[:product].permit(:name, :price, :description))
	 	redirect_to "/products", notice:"successfully updated the product"
	 else
	 	render action: "edit"
end
end
def destroy
	 @product=Product.find(params[:id])
	 @product.destroy
	 redirect_to "/products",notice: "successfully deleted"
	end

end