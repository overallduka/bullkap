=begin
require 'rails_helper'

RSpec.describe "people/index", :type => :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :name => "Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :cell_number => "Cell Number",
        :twitter => "Twitter",
        :facebook => "Facebook",
        :instagram => "Instagram",
        :bond_id => 1
      ),
      Person.create!(
        :name => "Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :cell_number => "Cell Number",
        :twitter => "Twitter",
        :facebook => "Facebook",
        :instagram => "Instagram",
        :bond_id => 1
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Cell Number".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Instagram".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
=end
