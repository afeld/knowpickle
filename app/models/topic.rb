class Topic < ActiveRecord::Base
  has_many :resources, :dependent => :nullify
end
