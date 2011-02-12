class AddPermalinkToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :permalink, :string
    
    # this will automatically set all permalinks
    Topic.all.each{|t| t.save! }
  end

  def self.down
    remove_column :topics, :permalink
  end
end
