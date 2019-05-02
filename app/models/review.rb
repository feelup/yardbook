class Review < ApplicationRecord
	has_many :hole_reviews
  validates :course_name, presence: true
  validates :rounding_date, presence: true
  validates :course_review, presence: true
end
