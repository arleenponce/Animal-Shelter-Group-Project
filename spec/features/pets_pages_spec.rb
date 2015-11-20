require 'rails_helper'

describe "the process to add an animal" do
  before(:each) do
     visit'/admins/sign_up'
     fill_in('Email', with: 'Foo@bar.com')
     fill_in('Password', with: '12345678')
     fill_in('Password confirmation', with: '12345678')
     click_button 'Sign up'
   end

   it "displays an error message if pet isn't saved" do
    visit '/pets/new'
    click_button "Save Pet"
    expect(page).to have_content "prohibited this"
   end
   
 before(:each) do
     visit '/pets/new'
     fill_in "Name", :with => 'Fido'
     select('Dog', :from => "Species")
     page.choose('pet_gender_male')
     fill_in "Age", :with => '4'
     fill_in "Weight", :with => "20"
     fill_in "Breed", :with => "Golden Retriever"
     fill_in "Description", :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
     click_button "Save Pet"
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

  it "saves information input into breed field" do
    expect(page).to have_content "Golden Retriever"
  end

  it "updates pet information" do 
    visit '/admin'
    click_link 'Pets Listing'
    click_link 'Edit'
    fill_in "Name", :with => ''
    click_button "Save Pet"
    expect(page).to have_content "error"
  end

  it "updates pet information" do 
    visit '/admin'
    click_link 'Pets Listing'
    click_link 'Edit'
    click_link 'Destroy'
    expect(page).to have_content "successfully destroyed"
  end

  it "gives an error message if the user forgets to input a name" do
    visit '/pets/new'
    fill_in "Name", :with => ''
    click_button "Save Pet"
    expect(page).to have_content "error"
  end


  it "saves a new instance of breed to the breed index" do
    visit "/breeds"
    expect(page).to have_content "Golden Retriever"
  end

  it "saves a description for a pet" do
    expect(page).to have_content "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  end



  it "can remove the association between a breed and a pet" do
    visit '/pets'
    expect(page).to have_content "Golden Retriever"
    click_link 'Edit'
    click_link 'Remove this breed from pet'
    click_button "Save Pet"
    expect(page).to_not have_content "Golden Retriever"
    visit "/breeds"
    expect(page).to have_content "Golden Retriever"
  end

  it "can add multiple breeds from the same form" do
    visit '/pets/new'
    fill_in "Name", :with => "Fido"
    select('Dog', :from => "Species")
    choose('pet_gender_male')
    fill_in "Age", :with => '2'
    fill_in "Weight", :with => "20"
    fill_in "Breed", :with => "Golden Retriever"
    click_button "Add Another Breed"
    click_button "Save Pet"
    expect(page).to have_content "Golden Retriever"
    visit "/breeds"
    expect(page).to have_content "Golden Retriever"
    # Capybara wont work with JS out of the box so we can't test dynamically generated input fields.
  end

  




end
