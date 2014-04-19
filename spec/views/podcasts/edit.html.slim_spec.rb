require 'spec_helper'

describe "podcasts/edit" do
  before(:each) do
    @podcast = assign(:podcast, stub_model(Podcast))
  end

  it "renders the edit podcast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", podcast_path(@podcast), "post" do
    end
  end
end
