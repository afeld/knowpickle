require 'spec_helper'

describe "resources/edit.html.erb" do
  before(:each) do
    @resource = assign(:resource, stub_model(Resource,
      :name => "MyString",
      :excerpt => "MyText",
      :url => "MyString",
      :creator_id => 1,
      :topic_id => 1
    ))
  end

  it "renders the edit resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => resource_path(@resource), :method => "post" do
      assert_select "input#resource_name", :name => "resource[name]"
      assert_select "textarea#resource_excerpt", :name => "resource[excerpt]"
      assert_select "input#resource_url", :name => "resource[url]"
      assert_select "input#resource_creator_id", :name => "resource[creator_id]"
      assert_select "input#resource_topic_id", :name => "resource[topic_id]"
    end
  end
end
