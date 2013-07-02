require 'spec_helper'

describe "wizards/index" do
  before(:each) do
    assign(:wizards, [
      stub_model(Wizard,
        :name => "Name"
      ),
      stub_model(Wizard,
        :name => "Name"
      )
    ])
  end

  it "renders a list of wizards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
