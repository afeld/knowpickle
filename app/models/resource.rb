class Resource < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  belongs_to :topic
  belongs_to :creator, :class_name => 'User'
end
