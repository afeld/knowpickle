class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :resource_id
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
