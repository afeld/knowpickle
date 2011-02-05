class Review < ActiveRecord::Base
  belongs_to :reviewer, :class_name => 'User'
  belongs_to :resource
  
  validates :resource_id, :presence => true
  validates :reviewer_id, :presence => true
  after_save :update_average_rating!
  
  private
  
  def update_average_rating!
    # TODO this should probably be done in batch
    self.resource.update_average_rating!
  end
end
