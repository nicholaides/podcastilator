require 'spec_helper'

describe "podcasts/index" do
  before(:each) do
    assign(:podcasts, [
      stub_model(Podcast),
      stub_model(Podcast)
    ])
  end

  it "renders a list of podcasts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
