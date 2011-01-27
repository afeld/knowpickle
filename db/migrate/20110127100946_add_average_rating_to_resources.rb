class AddAverageRatingToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :average_rating, :float
    Resource.all.each do |r|
      r.update_average_rating!
    end
  end

  def self.down
    remove_column :resources, :average_rating
  end
end
