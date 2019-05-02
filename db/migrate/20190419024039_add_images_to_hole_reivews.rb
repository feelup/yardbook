class AddImagesToHoleReivews < ActiveRecord::Migration[5.2]
  def change
    add_column :hole_reviews, :images, :json
  end
end
