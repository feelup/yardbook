class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :course_name
      t.date :rounding_date
      t.text :course_review

      t.timestamps
    end
  end
end
