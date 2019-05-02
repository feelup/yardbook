class HoleReviewsController < ApplicationController
  def show
    @review = Review.find(params[:review_id])
    @hole_review = @review.hole_reviews.find(params[:id])
  end

  def new
    @review = Review.find(params[:review_id])
    @hole_review = @review.hole_reviews.new
    @courses = Course.where(:club_name => @review.course_name)
    @hole_number = params[:hole_number]
  end

  def edit
    @review = Review.find(params[:review_id])
    @hole_review = @review.hole_reviews.find(params[:id])
  end

  def create
    @review = Review.find(params[:review_id])
    @hole_review = @review.hole_reviews.create(hole_review_params)
    if @hole_review.save
      redirect_to review_hole_review_path(@review, @hole_review)
    else
      render 'new'
    end
  end

  def update
    @review = Review.find(params[:review_id])
    if @hole_review = @review.hole_reviews.update(hole_review_params)
      redirect_to review_hole_review_path(@review, @hole_review)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @hole_review = @review.hole_reviews.find(params[:id])
    @hole_review.destroy
    redirect_to review_path(@review)
  end

  private
  def hole_review_params
    params.require(:hole_review).permit(:course_name, :hole_number, :hole_review, images: [])
  end
end
