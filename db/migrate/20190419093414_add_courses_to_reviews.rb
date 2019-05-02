class AddCoursesToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :courses, :json
  end
end
