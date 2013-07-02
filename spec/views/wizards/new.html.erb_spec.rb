require 'spec_helper'

describe "wizards/new" do
  before(:each) do
    assign(:wizard, stub_model(Wizard,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new wizard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wizards_path, "post" do
      assert_select "input#wizard_name[name=?]", "wizard[name]"
    end
  end
end
