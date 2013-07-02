require 'spec_helper'

describe "wizards/show" do
  before(:each) do
    @wizard = assign(:wizard, stub_model(Wizard,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
