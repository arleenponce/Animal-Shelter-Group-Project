require 'rails_helper'

describe "uploading pictures to a pet" do
  
  before(:each) do
     visit'/admins/sign_up'
     fill_in('Email', with: 'Foo@bar.com')
     fill_in('Password', with: '12345678')
     fill_in('Password confirmation', with: '12345678')
     click_button 'Sign up'
   end

  it "should allow a user to upload a picture to a pet" do
    visit '/pets/new'
    fill_in('Name', :with => "Fido")
    attach_file('photos[]', fixture_image_path)
    select("Dog", :from => "Species")
    click_button 'Save Pet'

  end

end

def fixture_image_path
  Rails.root.join('spec', 'support', 'puppy1.jpg')
end
