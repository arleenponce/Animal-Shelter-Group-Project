require 'rails_helper'
 
describe "the landing page" do
 
  it "diplays the landing page" do
    visit "/index"
    expect(page).to have_content "Meet Your New Best Friend"
  end
 
end