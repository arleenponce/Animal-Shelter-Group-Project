require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  it "should have an email address" do
  	anAdmin = Admin.new
  	anAdmin.email = "test@test.com"

  	expect(anAdmin.email).to eq "test@test.com"
  end

  it "should have a password" do
  	anAdmin = Admin.new
  	anAdmin.encrypted_password = "password"

  	expect(anAdmin.encrypted_password).to eq "password"
  end
  
end
