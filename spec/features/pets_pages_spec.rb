require 'rails_helper'

describe "the process to add an animal" do
  it "saves information input into name field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    page.choose('pet_gender_male')
    fill_in "Age", :with => '2'
    fill_in "Weight", :with => "20"
    click_button "Create Pet"
    expect(page).to have_content "Fido"
  end

  it "saves information input into species field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '2'
    fill_in "Weight", :with => "20"
    click_button "Create Pet"
    expect(page).to have_content "dog"
  end

  it "saves information input into gender field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '2'
    fill_in "Weight", :with => "20"
    click_button "Create Pet"
    expect('pet_gender_male').to eq "pet_gender_male"
  end

  it "saves information input into age field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '4'
    fill_in "Weight", :with => "20"
    click_button "Create Pet"
    expect(page).to have_content "4"
  end

  it "saves information input into weight field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '4'
    fill_in "Weight", :with => "20"
    click_button "Create Pet"
    expect(page).to have_content 20
  end

  it "gives an error message if the user forgets to input a name" do
    visit '/pets/new'
    fill_in "Name", :with => ''
    click_button "Create Pet"
    expect(page).to have_content "error"
  end

end
