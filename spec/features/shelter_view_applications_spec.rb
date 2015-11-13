require "rails_helper"

describe "the shelter can view application forms from potential adopters" do
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

     visit'/admins/sign_up'
     fill_in('Email', with: 'Foo@bar.com')
     fill_in('Password', with: '12345678')
     fill_in('Password confirmation', with: '12345678')
     click_button 'Sign up'

     visit '/application_forms'
   end

   it "should bring the shelter to the list of application forms page" do
     expect(page).to have_content "Listing Application Forms"
   end

   it "should have the name of a potential adopter" do
     expect(page).to have_content "John Doe"
   end

   it "should have the phone of a potential adopter" do
     expect(page).to have_content "+18585551234"
   end

   it "should have the email of a potential adopter" do
     expect(page).to have_content "john@doe.com"
   end

   it "should have the street address of a potential adopter" do
     expect(page).to have_content "123 Maple St."
   end

   it "should have the city of a potential adopter" do
     expect(page).to have_content "Eugene"
   end

   it "should have the state of a potential adopter" do
     expect(page).to have_content "OR"
   end

   it "should have the zipcode of a potential adopter" do
     expect(page).to have_content 80919
   end

   it "should have the information of a potential adopter" do
     expect(page).to have_content "short message"
   end

 end
