require 'spec_helper'

describe "reviews/new.html.erb" do
  before(:each) do
    assign(:review, stub_model(Review,
      :reviewer_id => 1,
      :resource_id => 1,
      :rating => 1,
      :comment => "MyText"
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path, :method => "post" do
      assert_select "input#review_reviewer_id", :name => "review[reviewer_id]"
      assert_select "input#review_resource_id", :name => "review[resource_id]"
      assert_select "input#review_rating", :name => "review[rating]"
      assert_select "textarea#review_comment", :name => "review[comment]"
    end
  end
end
