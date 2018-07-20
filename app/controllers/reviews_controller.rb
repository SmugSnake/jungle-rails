class ReviewsController < ApplicationController

    before_filter :authorize

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to :back
            puts @review.user.first_name
        else
            redirect_to :back
        end
    end

    def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to :back
    end

    private

    def review_params
      params.require(:review).permit(
        :description,
        :rating,
        :product_id,
        :user_id
      )
    end
        

end
