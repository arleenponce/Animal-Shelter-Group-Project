require 'rails_helper'

RSpec.describe "breeds/index", type: :view do
  before(:each) do
    assign(:breeds, [
      Breed.create!(
        :breed_name => "Breed Name"
      ),
      Breed.create!(
        :breed_name => "Breed Name"
      )
    ])
  end

  it "renders a list of breeds" do
    render
    assert_select "tr>td", :text => "Breed Name".to_s, :count => 2
  end
end
