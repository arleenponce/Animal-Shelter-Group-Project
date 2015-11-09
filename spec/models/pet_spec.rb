require_relative '../rails_helper'
# require 'paperclip'
# require "paperclip/matchers"

describe Pet do
  before(:each) do
    aDog = Pet.new
    aDogImage = PetImage.new
    aDogImage.photo_file_name = "dummyfile.jpg"
    aDogImage.photo_content_type = ".jpg"
    aDogImage.photo_file_size = "2mb"
    aDogImage.photo_updated_at = Date.new
    aDogImage.save
    
    aDog.pet_images.photo << aDogImage
    aDog.pet_images.photo.save
  end

  it "should have a photo" do
    expect(aDog.photo).not_to be_nil
  end
  # it { should have_attached_file(:photo) }
  # it { should validate_attachment_presence(:photo) }
  # it { should validate_attachment_content_type(:photo).
  #               allowing('image/jpg', 'image/gif').
  #               rejecting('text/plain', 'text/xml') }
  # it { should validate_attachment_size(:photo).
  #               less_than(5.megabytes) }

end
