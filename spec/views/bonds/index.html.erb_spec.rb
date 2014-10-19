require 'rails_helper'

RSpec.describe "bonds/index", :type => :view do
  before(:each) do
    assign(:bonds, [
      Bond.create!(
        :name => "Name"
      ),
      Bond.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of bonds" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
