=begin
require 'rails_helper'

RSpec.describe "people/show", :type => :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :name => "Name",
      :email => "Email",
      :phone_number => "Phone Number",
      :cell_number => "Cell Number",
      :twitter => "Twitter",
      :facebook => "Facebook",
      :instagram => "Instagram",
      :bond_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Cell Number/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Instagram/)
    expect(rendered).to match(/1/)
  end
end
=end
