class ReviewsController < ApplicationController
	before_action :authenticate_user!, only: [:create]
	def create
		@review=Review.new(params[:review].permit(:rating, :body, :product_id))
		@review.user_id=current_user.id
        if @review.save
      
      redirect_to :back, notice: "successfully added review"
  end
end
def destroy
	 @review=Review.find(params[:id])

	 @review.destroy
	 redirect_to :back,notice: "successfully removed"
	end

end