class Resource < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  belongs_to :topic
  belongs_to :creator, :class_name => 'User'
  
  def to_s
    self.name
  end
  
  def average_rating
    self.reviews.average :rating
  end
end
