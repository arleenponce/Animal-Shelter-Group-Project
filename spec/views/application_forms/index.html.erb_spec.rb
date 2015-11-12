require 'rails_helper'

RSpec.describe "application_forms/index", type: :view do
  before(:each) do
    assign(:application_forms, [
      ApplicationForm.create!(
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => 1,
        :information => "MyText"
      ),
      ApplicationForm.create!(
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => 1,
        :information => "MyText"
      )
    ])
  end

  it "renders a list of application_forms" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
