class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :club_name
      t.integer :number_of_holes
    end
  end
end
