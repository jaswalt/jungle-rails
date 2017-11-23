class ReviewsController < ApplicationController

  before_action :authorize

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to [@product], notice: 'Thank you for your review!'
    else
      redirect_to [@product], notice: 'Oops! Your review was not saved.'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    @product = Product.find params[:product_id]
    redirect_to [@product], notice: 'Review deleted.'
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
