require 'rails_helper'

RSpec.describe "application_forms/edit", type: :view do
  before(:each) do
    @application_form = assign(:application_form, ApplicationForm.create!(
      :name => "MyString",
      :phone => "223456789",
      :email => "MyString@email.com",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 12345,
      :information => "MyText"
    ))
  end

  it "renders the edit application_form form" do
    render

    assert_select "form[action=?][method=?]", application_form_path(@application_form), "post" do

      assert_select "input#application_form_name[name=?]", "application_form[name]"

      assert_select "input#application_form_phone[name=?]", "application_form[phone]"

      assert_select "input#application_form_email[name=?]", "application_form[email]"

      assert_select "input#application_form_street_address[name=?]", "application_form[street_address]"

      assert_select "input#application_form_city[name=?]", "application_form[city]"

      assert_select "input#application_form_state[name=?]", "application_form[state]"

      assert_select "input#application_form_zip[name=?]", "application_form[zip]"

      assert_select "textarea#application_form_information[name=?]", "application_form[information]"
    end
  end
end
