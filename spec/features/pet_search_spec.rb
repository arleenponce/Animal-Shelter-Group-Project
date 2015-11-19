require 'rails_helper'

describe "Search pets" do
  before(:each) do
    doggy = Pet.new
    doggy.name = "Malcolm"
    doggy.gender = "male"
    doggy.species = "dog"
    doggy.weight = 75
    doggy.age = "2 years 9 months"
    breed1 = Breed.create(breed_name: "Boxer")
    breed2 = Breed.create(breed_name: "Rhodesian Ridgeback")
    doggy.breeds << breed1
    doggy.breeds << breed2
    doggy.save

    maggy = Pet.new
    maggy.name = "Maggy"
    maggy.gender = "female"
    maggy.species = "dog"
    maggy.weight = 75
    maggy.age = "2 years 9 months"
    breed1 = Breed.create(breed_name: "Golden Retriever")
    maggy.breeds << breed1
    maggy.save

    teddy = Pet.new
    teddy.name = "Teddy"
    teddy.gender = "male"
    teddy.species = "dog"
    teddy.weight = 75
    teddy.age = "2 years 9 months"
    breed2 = Breed.create(breed_name: "Labrador Retriever")
    teddy.breeds << breed2
    teddy.save
  end

  before(:each) do
     visit'/admins/sign_up'
     fill_in('Email', with: 'Foo@bar.com')
     fill_in('Password', with: '12345678')
     fill_in('Password confirmation', with: '12345678')
     click_button 'Sign up'
   end


  it "should allow the user to search by empty keyword" do
    visit '/pets/search_pets'
    fill_in("Find pet", :with => "")
    click_button 'Search'
    expect(page).to have_content 'No pets found'
  end

  it "should search pet names" do
    visit '/pets/search_pets'
    fill_in("Find pet", :with => "Malcolm")
    click_button 'Search'
    expect(page).to have_content 'Malcolm'
  end

  it "should search animal type (species)" do
    visit '/pets/search_pets'
    fill_in("Find pet", :with => "dog")
    click_button 'Search'
    expect(page).to have_content 'Malcolm'
  end

  it "should search animal gender" do
    visit '/pets/search_pets'
    fill_in("Find pet", :with => "Male")
    click_button 'Search'
    expect(page).to have_content 'Malcolm'
  end

  it "should search animal age" do
    visit '/pets/search_pets'
    fill_in("Find pet", :with => "2 years")
    click_button 'Search'
    expect(page).to have_content 'Malcolm'
  end

  it "should search allow you to search by breed" do
    visit '/pets/search_pets'
    fill_in("Search by breed", :with => "Boxer")
    click_button 'Search'
    expect(page).to have_content 'Malcolm'
  end

  it "should return all animals from multiple breeds with shared keywords" do
    visit '/pets/search_pets'
    fill_in("Search by breed", :with => "Retriever")
    click_button 'Search'
    expect(page).to have_content 'Maggy'
    expect(page).to have_content 'Teddy'
  end

  it "should return all animals that meet at least one of the search criteria" do
    visit '/pets/search_pets'
    fill_in("Find pet", :with => "Malcolm")
    fill_in("Search by breed", :with => "Retriever")
    click_button 'Search'
    expect(page).to have_content 'Malcolm'
    expect(page).to have_content 'Maggy'
    expect(page).to have_content 'Teddy'
  end

it "should return all animals that match at least 30% of the search term" do
    visit '/pets/search_pets'
      fill_in("Search by breed", :with => "Box")
      click_button 'Search'
      expect(page).to have_content 'Malcolm'
      # expect(page).to have_content 'Teddy'
  end
end
