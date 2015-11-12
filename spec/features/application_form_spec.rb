require 'rails_helper'

describe "the user to fill out an application" do
  before(:each) do
    visit '/application_forms/new'
    fill_in "Name", :with => "John Doe"
    fill_in "Phone", :with => "8585551234"
    fill_in "Email", :with => "john@doe.com"
    fill_in "Street address", :with => "123 Maple St."
    fill_in "City", :with => "Eugene"
    select('Oregon', :from => "State")
    fill_in "Zip Code", :with => 80919
    fill_in "Please describe what type of animal you are looking for. If you see an animal you like on our webpage, please also include their name, species and breed.", :with => "short message"
    click_button "Create Application form"
  end

  it "saves name" do
    expect(page).to have_content "John Doe"
  end

  it "saves phone" do
    expect(page).to have_content "8585551234"
  end

  it "saves email" do
    expect(page).to have_content "john@doe.com"
  end

  it "saves address" do
    expect(page).to have_content "123 Maple St."
  end

  it "saves city" do
    expect(page).to have_content "Eugene"
  end

  it "saves state" do
    expect(page).to have_content "OR"
  end

  it "saves zip" do
    expect(page).to have_content "80919"
  end

  it "saves information" do
    expect(page).to have_content "short message"
  end

end
