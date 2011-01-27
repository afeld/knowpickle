class AddLevelToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :level, :string
  end

  def self.down
    remove_column :resources, :level
  end
end
