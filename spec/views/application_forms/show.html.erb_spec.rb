require 'rails_helper'

RSpec.describe "application_forms/show", type: :view do
  before(:each) do
    @application_form = assign(:application_form, ApplicationForm.create!(
      :name => "Name",
      :phone => "Phone",
      :email => "Email",
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zip => 1,
      :information => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
