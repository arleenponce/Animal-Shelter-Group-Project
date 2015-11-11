require 'rails_helper'

RSpec.describe Breed, type: :model do
  it "may be multiple pets" do
    doggy1 = Pet.create(
      name: 'Killer',
      species: 'dog',
      gender: 'male',
      age: '2',
      weight: '70')
    doggy2 = Pet.create(
        name: 'Killer',
        species: 'dog',
        gender: 'male',
        age: '2',
        weight: '70')

    breed1 = Breed.create(breed_name: "Boxer")
    breed2 = Breed.create(breed_name: "Poodle")
    doggy1.breeds << breed1
    doggy1.breeds << breed2
    doggy1.save
    doggy2.breeds << breed1
    doggy2.save
    expect(breed1.pets).to match_array([doggy1, doggy2])
    expect(breed2.pets).to match_array([doggy1])
  end
end
