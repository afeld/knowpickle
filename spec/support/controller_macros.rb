module ControllerMacros
  def login_admin
    @request.env["devise.mapping"] = :admin
    sign_in Factory.create(:admin)
  end
  
  def login_user
    @request.env["devise.mapping"] = :user
    sign_in Factory.create(:user)
  end
end
