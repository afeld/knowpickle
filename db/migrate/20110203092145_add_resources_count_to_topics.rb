class AddResourcesCountToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :resources_count, :integer, :default => 0

    Topic.reset_column_information
    Topic.all.each do |t|
      Topic.update_counters t.id, :resources_count => t.resources.length
    end
  end

  def self.down
    remove_column :topics, :resources_count
  end
end
