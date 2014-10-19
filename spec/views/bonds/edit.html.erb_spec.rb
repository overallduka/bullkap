require 'rails_helper'

RSpec.describe "bonds/edit", :type => :view do
  before(:each) do
    @bond = assign(:bond, Bond.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit bond form" do
    render

    assert_select "form[action=?][method=?]", bond_path(@bond), "post" do

      assert_select "input#bond_name[name=?]", "bond[name]"
    end
  end
end
