class ChangeCoursesToBeArrayInReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :courses
    add_column :reviews, :courses, :text, array: true, default: []
  end
end
