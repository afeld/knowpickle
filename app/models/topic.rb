class Topic < ActiveRecord::Base
  default_value_for :enabled, false
  default_scope order(:name)
  scope :enabled, where(:enabled => true)
  
  has_many :resources, :dependent => :nullify
  
  validates :name, :presence => true
  
  def to_s
    self.name
  end
end
