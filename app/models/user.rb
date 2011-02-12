class User < ActiveRecord::Base
  ROLES = %w[admin moderator contributor banned]
  default_value_for :role, 'contributor'
  
  has_many :created_resources, :class_name => 'Resource', :foreign_key => 'contributor_id', :dependent => :nullify
  has_many :reviews, :foreign_key => 'reviewer_id', :dependent => :nullify
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :display_name
  
  validates :role, :presence => true
  
  def admin?
    self.role == 'admin'
  end
  
  def to_s
    self.display_name.present? ? self.display_name : "Anonymous"
  end
end
