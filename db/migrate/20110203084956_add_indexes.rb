class AddIndexes < ActiveRecord::Migration
  def self.up
    change_table :resources do |t|
      t.index :topic_id
      t.index [:topic_id, :average_rating]
      t.index [:topic_id, :level]
      t.index :url, :unique => true
    end
    
    change_table :reviews do |t|
      t.index :resource_id
      t.index [:resource_id, :created_at]
      t.index [:resource_id, :rating]
    end
  end

  def self.down
    change_table :resources do |t|
      t.remove_index :topic_id
      t.remove_index [:topic_id, :average_rating]
      t.remove_index [:topic_id, :level]
      t.remove_index :url
    end
    
    change_table :reviews do |t|
      t.remove_index :resource_id
      t.remove_index [:resource_id, :created_at]
      t.remove_index [:resource_id, :rating]
    end
  end
end
