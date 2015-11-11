require 'rails_helper'

RSpec.describe "breeds/show", type: :view do
  before(:each) do
    @breed = assign(:breed, Breed.create!(
      :breed_name => "Breed Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Breed Name/)
  end
end
