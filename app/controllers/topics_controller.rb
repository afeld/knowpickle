class TopicsController < ApplicationController
  load_resource :find_by => :permalink
  authorize_resource
  
  before_filter :authenticate_user!, :only => :new
  
  # GET /topics
  # GET /topics.xml
  def index
    @topics = Topic.enabled

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topics }
    end
  end

  # GET /topics/:permalink
  # GET /topics/:permalink.xml
  def show
    @topic = Topic.find_by_permalink!(params[:id])
    @resources = Resource.where(:topic_id => @topic.id).order('average_rating DESC').all
    @resource = Resource.new(:topic => @topic)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # POST /topics
  # POST /topics.xml
  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to(topics_path, :notice => "\"#{@topic.name}\" has been successfully suggested as a Topic.") }
        format.xml  { render :xml => @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to(topics_url) }
      format.xml  { head :ok }
    end
  end
end
