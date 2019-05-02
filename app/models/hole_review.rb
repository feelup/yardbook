class HoleReview < ApplicationRecord
	mount_uploaders :images, ImageUploader
  belongs_to :review
  def self.get_hole_review(review_id, course_name, hole_number)
    where(:review_id => review_id).where(:course_name => course_name).where(:hole_number => hole_number).first
  end
end
