require 'rails_helper'

RSpec.describe "breeds/new", type: :view do
  before(:each) do
    assign(:breed, Breed.new(
      :breed_name => "MyString"
    ))
  end

  it "renders new breed form" do
    render

    assert_select "form[action=?][method=?]", breeds_path, "post" do

      assert_select "input#breed_breed_name[name=?]", "breed[breed_name]"
    end
  end
end
