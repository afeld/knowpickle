class AddEnabledToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :enabled, :boolean
    Topic.all.each do |t|
      t.enabled = true
      t.save
    end
  end

  def self.down
    remove_column :topics, :enabled
  end
end
