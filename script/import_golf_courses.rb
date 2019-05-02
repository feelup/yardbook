#!/usr/bin/env ruby

require 'rubygems'
require 'json'
require 'open-uri'

Course.delete_all
url = "https://github.com/naktamello/scraped_data00/raw/master/json_files/data.json"
json = open(url).read

for i in 0..JSON.parse(json).length-1 do
  club_name = JSON.parse(json)[i]['name']
  first_part_course_name = ''
  for j in 0..JSON.parse(json)[i]['courses'].length-1 do
    course_name = JSON.parse(json)[i]['courses'][j]
    if course_name.include? '('
      puts i
      course_name = first_part_course_name.concat(' ').concat(course_name)
      number_of_holes = course_name.split('(')[1].split('H')[0].strip
      course = Course.new(:course_name => course_name, :club_name => club_name, :number_of_holes => number_of_holes)
      puts club_name
      puts course_name
      course.save
      first_part_course_name = ''
    else
      first_part_course_name.concat(course_name)
    end
  end
end