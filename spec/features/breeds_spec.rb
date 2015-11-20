require "rails_helper"


describe Breed do 

  

  before(:each) do
    visit'/admins/sign_up'
    fill_in('Email', with: 'Foo@bar.com')
    fill_in('Password', with: '12345678')
    fill_in('Password confirmation', with: '12345678')
    click_button 'Sign up'

    visit '/breeds/new'
    fill_in 'Breed name', :with => "Corgi"
    click_button 'Create Breed'

  end


  it "updates a breed" do
    visit '/breeds'
    click_link 'Edit'
    fill_in 'Breed name', :with => "Boxer"
    click_button "Update Breed"
    expect(page).to have_content "Breed was successfully updated"

  end

  it "be able to add a breed" do 
    expect(page).to have_content "Corgi"
  end

  it "is able to delete/destroy a breed" do
    visit '/breeds'
    click_link 'Destroy'
    expect(page).to have_content "Breed was successfully destroyed"
  end


  
end