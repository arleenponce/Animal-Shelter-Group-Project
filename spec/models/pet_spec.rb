require 'rails_helper'

describe Pet do
  it "is valid with a name, species, gender, age, weight" do
      pet = Pet.new(
        name: 'Killer',
        species: 'dog',
        gender: 'female',
        age: '2',
        weight: '70')
      expect(pet).to be_valid
    end

    it "is invalid without a name" do
      pet = Pet.new(
        species: 'dog',
        gender: 'female',
        age: '2',
        weight: '70')
      pet.valid?
      expect(pet.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a species" do
      pet = Pet.new(
        name: 'Killer',
        gender: 'female',
        age: '2',
        weight: '70')
      pet.valid?
      expect(pet.errors[:species]).to include("can't be blank")
    end

    it "is invalid without a gender" do
      pet = Pet.new(
        name: 'Killer',
        species: 'dog',
        age: '2',
        weight: '70')
        pet.valid?
        expect(pet.errors[:gender]).to include("can't be blank")
    end
    it "is invalid without an age" do
      pet = Pet.new(
        name: 'Killer',
        species: 'dog',
        weight: '70')
        pet.valid?
        expect(pet.errors[:age]).to include("can't be blank")
    end

    it "weight is invalid with a negative integer" do
      pet = Pet.new(
        name: 'Killer',
        species: 'dog',
        weight: '-70')
        pet.valid?
        expect(pet.errors[:weight]).to include("must be greater than or equal to 1")
    end

    it "is invalid without a weight" do
      pet = Pet.new(
        name: 'Killer',
        species: 'dog',
        age: '2')
        pet.valid?
        expect(pet.errors[:weight]).to include("can't be blank")
    end

    it "should be able to have a description" do
      aDog = Pet.new
      aDog.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."

      expect(aDog.description).to eq "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    end

    it "should be able to have many photos" do
      aDog = Pet.new
      aDog.name = "Fido"

      aDogImage = PetImage.new

      expect(aDog.pet_images.to_a).to be_kind_of Array
    end
end
