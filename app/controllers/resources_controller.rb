class ResourcesController < ApplicationController
  load_and_authorize_resource
  
  # GET /resources
  # GET /resources.xml
  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.xml
  def show
    @resource = Resource.find(params[:id])
    @reviews = Review.where(:resource_id => @resource).order('created_at DESC').all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.xml
  def new
    opts = {}
    opts[:topic_id] = params['topic_id'].to_i if params['topic_id']
    @resource = Resource.new(opts)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.xml
  def create
    existing_resource = Resource.find_by_url(params[:resource][:url])
    if existing_resource
      flash[:notice] = "That resource has already been added, but please give it a review!"
      redirect_to resource_path(existing_resource) and return
    end
    @resource = Resource.new(params[:resource])
    @resource.contributor = current_user

    respond_to do |format|
      if @resource.save
        format.html { redirect_to(@resource, :notice => 'Resource was successfully created.') }
        format.xml  { render :xml => @resource, :status => :created, :location => @resource }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.xml
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html {
          if request.xhr?
            render :text => params[:resource].values.first
          else
            redirect_to(@resource, :notice => 'Resource was successfully updated.')
          end
        }
        format.xml  { head :ok }
      else
        format.html {
          if request.xhr?
            render :text => @resource[params[:resource].keys.first]
          else
            render :action => "edit"
          end
        }
        format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.xml
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to(resources_url) }
      format.xml  { head :ok }
    end
  end
end
