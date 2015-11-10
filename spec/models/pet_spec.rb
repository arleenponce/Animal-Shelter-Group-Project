require_relative '../rails_helper'
# require 'paperclip'
# require "paperclip/matchers"

describe Pet do

  it "should be able to have many photos" do
    aDog = Pet.new
    aDog.name = "Fido"

    aDogImage = PetImage.new

    expect(aDog.pet_images.to_a).to be_kind_of Array
  end
end
