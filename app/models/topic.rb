class Topic < ActiveRecord::Base
  has_many :resources, :dependent => :nullify
  
  def to_s
    self.name
  end
end
