class Topic < ActiveRecord::Base
  default_value_for :enabled, false
  default_scope order(:name)
  scope :enabled, where(:enabled => true)
  
  has_many :resources, :dependent => :nullify
  
  before_save :set_permalink
  
  validates :name, :presence => true
  
  def to_s
    self.name
  end
  
  # show Topics by name (not id)
  def to_param
    self.permalink
  end
  
  def set_permalink
    self.permalink = self.name.parameterize
  end
end
