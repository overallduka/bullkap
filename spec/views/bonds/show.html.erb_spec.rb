require 'rails_helper'

RSpec.describe "bonds/show", :type => :view do
  before(:each) do
    @bond = assign(:bond, Bond.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
