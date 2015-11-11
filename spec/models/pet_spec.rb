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

    it "should be able to have many photos" do
      aDog = Pet.new
      aDog.name = "Fido"

      aDogImage = PetImage.new

      expect(aDog.pet_images.to_a).to be_kind_of Array
    end

    it "may be multiple breeds" do
      doggy1 = Pet.new(
        name: 'Killer',
        species: 'dog',
        age: '2',
        weight: '70')
      doggy2 = Pet.new(
          name: 'Killer',
          species: 'dog',
          age: '2',
          weight: '70')

      breed1 = Breed.create(breed_name: "Boxer")
      breed2 = Breed.create(breed_name: "Poodle")
      doggy1.breeds << breed1
      doggy1.breeds << breed2
      doggy1.save
      doggy2.breeds << breed1
      doggy2.save

      expect(doggy1.breeds).to match_array([breed1, breed2])
      expect(doggy2.breeds).to match_array([breed1])
    end
  end
end
