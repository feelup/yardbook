class Course < ApplicationRecord
  def self.get_course(club_name, course_name)
    where(:club_name => club_name).where(:course_name => course_name).first
  end
end