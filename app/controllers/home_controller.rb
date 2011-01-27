class HomeController < ApplicationController
  def index
    @resources = Resource.order('created_at DESC').limit(10).all
    @topics = Topic.all
  end
end
