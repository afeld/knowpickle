require 'spec_helper'

describe "reviews/edit.html.erb" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :reviewer_id => 1,
      :resource_id => 1,
      :rating => 1,
      :comment => "MyText"
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => review_path(@review), :method => "post" do
      assert_select "input#review_reviewer_id", :name => "review[reviewer_id]"
      assert_select "input#review_resource_id", :name => "review[resource_id]"
      assert_select "input#review_rating", :name => "review[rating]"
      assert_select "textarea#review_comment", :name => "review[comment]"
    end
  end
end
