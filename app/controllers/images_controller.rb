class ImagesController < ApplicationController
  before_action :set_hole_review
  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @hole_review.save
    redirect_to review_hole_review_path(@review, @hole_review)
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @hole_review.save
    redirect_to review_hole_review_path(@review, @hole_review)
  end

  private

  def set_hole_review
    @review = Review.find(params[:review_id])
    @hole_review = @review.hole_reviews.find(params[:hole_review_id])
  end

  def add_more_images(new_images)
    images = @hole_review.images 
    images += new_images
    @hole_review.images = images
  end

  def remove_image_at_index(index)
     remain_images = @hole_review.images
     if index == 0 && @hole_review.images.size == 1
       @hole_review.remove_images!
     else
       deleted_image = remain_images.delete_at(index) 
       deleted_image.try(:remove!)
       @hole_review.images = remain_images
     end
  end

  def images_params
    params.require(:hole_review).permit({images: []}) # allow nested params as array
  end
end
