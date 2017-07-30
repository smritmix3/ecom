class CategoriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :check_is_admin, except: [:index, :show] #check for url manipulation
  def index
    @categories=Category.all
  end
   def new
   	@category=Category.new
end
def create
	 @category=Category.new(params[:category].permit(:name))
	 if @category.save
	 	redirect_to "/categories",notice: "successfully created category"
	 else
	 	render action: "new"
end
end
def show
	  @category = Category.find(params[:id])
	  @products = Product.where('category_id = ?',params[:id])
end
def edit
	  @category = Category.find(params[:id])
	end

def update
	 @category = Category.find(params[:id])
	 if @category.update_attributes(params[:category].permit(:name))
	 	redirect_to @category, notice:"successfully updated the category"
	 else
	 	render action: "edit"
end
end
def destroy
	 @category=Category.find(params[:id])
	 @category.destroy
	 redirect_to "/categories",notice: "successfully deleted"
	end
end
