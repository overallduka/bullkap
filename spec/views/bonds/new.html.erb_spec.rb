require 'rails_helper'

RSpec.describe "bonds/new", :type => :view do
  before(:each) do
    assign(:bond, Bond.new(
      :name => "MyString"
    ))
  end

  it "renders new bond form" do
    render

    assert_select "form[action=?][method=?]", bonds_path, "post" do

      assert_select "input#bond_name[name=?]", "bond[name]"
    end
  end
end
