class Resource < ActiveRecord::Base
  belongs_to :topic
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
end
