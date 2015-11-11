require 'rails_helper'

describe "the process to add an animal" do

  before(:each) do
     visit'/admins/sign_up'
     fill_in('Email', with: 'Foo@bar.com')
     fill_in('Password', with: '12345678')
     fill_in('Password confirmation', with: '12345678')
     click_button 'Sign up'
   end

  it "saves information input into name field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    page.choose('pet_gender_male')
    fill_in "Age", :with => '2'
    fill_in "Weight", :with => "20"
    fill_in "Breed", :with => "Golden Retriever"
    click_button "Save Pet"
    expect(page).to have_content "Fido"
  end

  it "saves information input into species field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '2'
    fill_in "Weight", :with => "20"
    fill_in "Breed", :with => "Golden Retriever"
    click_button "Save Pet"
    expect(page).to have_content "dog"
  end

  it "saves information input into gender field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '2'
    fill_in "Weight", :with => "20"
    fill_in "Breed", :with => "Golden Retriever"
    click_button "Save Pet"
    expect(page).to have_content "male"
  end

  it "saves information input into age field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '4'
    fill_in "Weight", :with => "20"
    fill_in "Breed", :with => "Golden Retriever"
    click_button "Save Pet"
    expect(page).to have_content "4"
  end

  it "saves information input into weight field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '4'
    fill_in "Weight", :with => "20"
    fill_in "Breed", :with => "Golden Retriever"
    click_button "Save Pet"
    expect(page).to have_content 20
  end

  it "saves information input into breed field" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '4'
    fill_in "Weight", :with => "20"
    fill_in "Breed", :with => "Golden Retriever"
    click_button "Save Pet"
    expect(page).to have_content "Golden Retriever"
  end

  it "gives an error message if the user forgets to input a name" do
    visit '/pets/new'
    fill_in "Name", :with => ''
    click_button "Save Pet"
    expect(page).to have_content "error"
  end

  it "saves a new instance of breed to the breed index" do
    visit '/pets/new'
    fill_in "Name", :with => 'Fido'
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '4'
    fill_in "Weight", :with => "20"
    fill_in "Breed", :with => "Golden Retriever"
    click_button "Save Pet"
    visit "/breeds"
    expect(page).to have_content "Golden Retriever"
  end

end
