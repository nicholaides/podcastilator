require 'spec_helper'

describe "podcasts/new" do
  before(:each) do
    assign(:podcast, stub_model(Podcast).as_new_record)
  end

  it "renders new podcast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", podcasts_path, "post" do
    end
  end
end
