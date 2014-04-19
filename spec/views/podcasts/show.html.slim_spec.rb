require 'spec_helper'

describe "podcasts/show" do
  before(:each) do
    @podcast = assign(:podcast, stub_model(Podcast))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
