require 'rails_helper'

describe "what the index page should have" do

  before(:each) do
    visit '/pets/new'
    attach_file("photos[]", fixture_image_path)
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    page.choose('pet_gender_male')
    fill_in "Age", :with => '2'
    fill_in "Weight", :with => "20"
    click_button "Create Pet"
    click_link "Back"
  end

  it "displays a thumbnail photo" do
    expect(page).to have_selector("img")
  end
end

def fixture_image_path
  Rails.root.join('spec', 'support', 'puppy1.jpg')
end
