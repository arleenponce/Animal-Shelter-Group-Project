require_relative '../rails_helper'

describe PetImage do

  it "should belong to a pet" do
    aDog = Pet.new
    aDog.name = "Fido"

    aDogImage = PetImage.new

    aDogImage.pet = aDog
    expect(aDogImage.pet).to eq aDog
  end
end
