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
end
