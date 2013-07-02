require 'spec_helper'

describe "wizards/edit" do
  before(:each) do
    @wizard = assign(:wizard, stub_model(Wizard,
      :name => "MyString"
    ))
  end

  it "renders the edit wizard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wizard_path(@wizard), "post" do
      assert_select "input#wizard_name[name=?]", "wizard[name]"
    end
  end
end
