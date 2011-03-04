require 'spec_helper'

describe "Resources" do
  it "should be able to view a resource by ID" do
    @resource = Factory.create(:resource)
    
    get "/resources/#{@resource.id}"
    response.status.should be(200)
  end
  
  it "should show the resource" do
    @resource = Factory.create(:resource)
    
    visit "/resources/#{@resource.id}"
    page.should have_content(@resource.name)
  end
  
  context "when signed in" do
    before do
      
    end
  end
end
