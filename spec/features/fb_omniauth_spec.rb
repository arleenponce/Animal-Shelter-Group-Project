require "rails_helper"

describe "access application form" do
  before(:each) do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "can sign in from Facebook" do
    visit '/application_forms/new'
    expect(page).to have_content("Sign in with Facebook")
    click_link "Sign in with Facebook"
    expect(page).to have_content("testuser")
    expect(page).to have_content("Sign Out")
  end
end
