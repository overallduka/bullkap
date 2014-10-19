=begin
require 'rails_helper'

RSpec.describe "people/edit", :type => :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :name => "MyString",
      :email => "MyString",
      :phone_number => "MyString",
      :cell_number => "MyString",
      :twitter => "MyString",
      :facebook => "MyString",
      :instagram => "MyString",
      :bond_id => 1
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input#person_name[name=?]", "person[name]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_phone_number[name=?]", "person[phone_number]"

      assert_select "input#person_cell_number[name=?]", "person[cell_number]"

      assert_select "input#person_twitter[name=?]", "person[twitter]"

      assert_select "input#person_facebook[name=?]", "person[facebook]"

      assert_select "input#person_instagram[name=?]", "person[instagram]"

      assert_select "input#person_bond_id[name=?]", "person[bond_id]"
    end
  end
end
=end