class ReviewsController < ApplicationController
  def autocomplete_course_club_name
    render json: json_for_autocomplete(Course.select(:club_name).distinct.where('LOWER(courses.club_name) ILIKE ?', "%#{params[:term]}%"), :club_name)
  end
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @courses = Course.where(:club_name => @review.course_name)
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
    @courses = Course.where(:club_name => @review.course_name)
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review
    else
      render 'new'
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:course_name, :rounding_date, :course_review, courses: [])
  end
end
