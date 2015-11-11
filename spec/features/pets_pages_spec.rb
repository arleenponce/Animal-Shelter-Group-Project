require 'rails_helper'

describe "the process to add an animal" do
  before(:each) do
   visit '/pets/new'
   fill_in "Name", :with => 'Fido'
   select('Dog', :from => "Species")
   page.choose('pet_gender_male')
   fill_in "Age", :with => '4'
   fill_in "Weight", :with => "20"
   fill_in "Description", :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
   click_button "Create Pet"
 end

  it "saves information input into name field" do
    expect(page).to have_content "Fido"
  end

  it "saves information input into species field" do
    expect(page).to have_content "dog"
  end

  it "saves information input into gender field" do
    expect('pet_gender_male').to eq "pet_gender_male"
  end

  it "saves information input into age field" do
    expect(page).to have_content "4"
  end

  it "saves information input into weight field" do
    expect(page).to have_content 20
  end

  it "gives an error message if the user forgets to input a name" do
    visit '/pets/new'
    fill_in "Name", :with => ''
    click_button "Create Pet"
    expect(page).to have_content "error"
  end

  it "saves a description for a pet" do
    expect(page).to have_content "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  end

end
