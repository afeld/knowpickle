class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :name
      t.text :excerpt
      t.string :url
      t.integer :creator_id
      t.integer :topic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
