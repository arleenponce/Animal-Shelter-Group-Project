require 'rails_helper'



describe ApplicationForm do



  before(:each) do
    @newApplication = ApplicationForm.new
    @newApplication.name = "John Doe"
    @newApplication.phone = "8001234567"
    @newApplication.email = "john@doe.com"
    @newApplication.street_address = "123 Main St."
    @newApplication.city = "Eugene"
    @newApplication.state = "OR"
    @newApplication.zip = 76590
    @newApplication.information = "Enter some information here."
  end

  it "is valid with a name, phone, email, street address, city, state, zip, information" do
    expect(@newApplication).to be_valid
  end

  it "is invalid with an empty name field" do
    newApplication = ApplicationForm.new
    newApplication.valid?
    expect(newApplication.errors[:name]).to include("can't be blank")
  end

  it "should have a name" do
    expect(@newApplication.name).to eq "John Doe"
  end

  it "is invalid with an empty phone field" do
    newApplication = ApplicationForm.new
    newApplication.valid?
    expect(newApplication.errors[:phone]).to include("can't be blank")
  end

  it "should have a phone number" do
    expect(@newApplication.phone).to eq "8001234567"
  end

  it "is invalid with an empty email field" do
    newApplication = ApplicationForm.new
    newApplication.valid?
    expect(newApplication.errors[:email]).to include("is invalid")
  end

  it "should have a email address" do
    expect(@newApplication.email).to eq "john@doe.com"
  end

  it "is invalid with an empty street address field" do
    newApplication = ApplicationForm.new
    newApplication.valid?
    expect(newApplication.errors[:street_address]).to include("can't be blank")
  end

  it "should have a street address" do
    expect(@newApplication.street_address).to eq "123 Main St."
  end

  it "is invalid with an empty city field" do
    newApplication = ApplicationForm.new
    newApplication.valid?
    expect(newApplication.errors[:city]).to include("can't be blank")
  end

  it "should have a city" do
    expect(@newApplication.city).to eq "Eugene"
  end


  it "should have a state" do
    expect(@newApplication.state).to eq "OR"
  end

  it "is invalid with an empty zip field" do
    newApplication = ApplicationForm.new
    newApplication.valid?
    expect(newApplication.errors[:zip]).to include("Code must be valid")
  end

  it "should have a zip code" do
    expect(@newApplication.zip).to eq 76590
  end

  it "is invalid with an empty information field" do
    newApplication = ApplicationForm.new
    newApplication.valid?
    expect(newApplication.errors[:information]).to include("can't be blank")
  end

  it "should have information" do
    expect(@newApplication.information).to eq "Enter some information here."
  end

  it "throws an error if application does not save" do
    newApplication = ApplicationForm.new
    newApplication.valid?
    expect(newApplication.errors[:name]).to include("can't be blank")
  end

end
