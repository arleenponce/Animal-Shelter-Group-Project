require 'rails_helper'

RSpec.describe "application_forms/new", type: :view do
  before(:each) do
    assign(:application_form, ApplicationForm.new(
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :information => "MyText"
    ))
  end

  it "renders new application_form form" do
    render

    assert_select "form[action=?][method=?]", application_forms_path, "post" do

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
