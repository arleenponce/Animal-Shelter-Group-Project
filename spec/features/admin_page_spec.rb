require "rails_helper"

describe "the admin control panel" do
  before(:each) do
    visit'/admins/sign_up'
    fill_in('Email', with: 'Foo@bar.com')
    fill_in('Password', with: '12345678')
    fill_in('Password confirmation', with: '12345678')
    click_button 'Sign up'

    visit'/admin'

  end


  it "should have links to other pages" do
    expect(page).to have_content "Add a Pet"
    expect(page).to have_content "Pet Listing"
    expect(page).to have_content "Applications"
    expect(page).to have_content "Main Page"
  end

  it "should be able to go to the add a new pet page" do
    click_link "Add a Pet"
    expect(page).to have_content "New Pet"
  end

  it "should be able to go to the pets listing page" do
<<<<<<< HEAD
    click_link "Pets Listing"
    expect(page).to have_content "Meet our furry friends"
=======
    click_link "Pet Listing"
    expect(page).to have_content "Meet our furry friends!"
>>>>>>> fontChanges
  end

  it "should be able to go to the list of submitted applications" do
    click_link "Applications"
    expect(page).to have_content "Listing Application Forms"
  end

  it "should be able to go to the main page" do
    click_link "Main Page"
    expect(page).to have_content "ShelterFriends"
  end


end
