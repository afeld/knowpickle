class Topic < ActiveRecord::Base
  default_value_for :enabled, false
  default_scope where(:enabled => true)
  
  has_many :resources, :dependent => :nullify
  
  def to_s
    self.name
  end
end
