class RenameCreatorToContributor < ActiveRecord::Migration
  def self.up
    rename_column :resources, :creator_id, :contributor_id
  end

  def self.down
    rename_column :resources, :contributor_id, :creator_id
  end
end
