class Review < ActiveRecord::Base
  belongs_to :reviewer, :class_name => 'User'
  belongs_to :resource
  
  validates :resource_id, :presence => true
  validates :reviewer_id, :presence => true
  validates_uniqueness_of :resource_id, :scope => :reviewer_id, :message => "can only be reviewed once"
  after_save :update_average_rating!
  
  private
  
  def update_average_rating!
    # TODO this should probably be done in batch
    self.resource.update_average_rating!
  end
end
