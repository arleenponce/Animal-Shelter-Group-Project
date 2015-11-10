require 'rails_helper'

describe "uploading pictures to a pet" do
  it "should allow a user to upload a picture to a pet" do
    visit '/pets/new'
    fill_in('Name', :with => "Fido")
    attach_file('photos[]', fixture_image_path)
    select("Dog", :from => "species")

    click_button 'Create Pet'

  end

end

def fixture_image_path
  Rails.root.join('spec', 'support', 'puppy1.jpg')
end
