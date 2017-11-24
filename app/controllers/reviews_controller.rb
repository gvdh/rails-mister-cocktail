class ReviewsController < ApplicationController


  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      redirect_to @review.cocktail
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:title, :rating, :content)
  end
end
