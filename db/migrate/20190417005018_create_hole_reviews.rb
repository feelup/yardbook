class CreateHoleReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :hole_reviews do |t|
      t.string :course_name
      t.integer :hole_number
      t.text :hole_review
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
