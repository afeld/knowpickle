class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.includes(:created_resources => :topic).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
end
