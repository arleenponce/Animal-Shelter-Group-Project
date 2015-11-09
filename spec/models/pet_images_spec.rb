require_relative '../rails_helper'

describe PetImage do
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

  it "should belong to a pet" do
    expect(aDogImage).to eq aDog.pet_images.photo
  end
end
