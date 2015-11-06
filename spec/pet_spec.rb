require_relative 'rails_helper'
# require 'paperclip'
# require "paperclip/matchers"

describe Pet do
  before(:each) do
    aDog = Pet.new
    aDog.photo = File.new("app/assets/images/puppy1.jpg")
  end

  it "should have a photo" do
    expect(aDog.photo).not_to be_nil
  end
  # it { should have_attached_file(:photo) }
  # it { should validate_attachment_presence(:photo) }
  # it { should validate_attachment_content_type(:photo).
  #               allowing('image/jpg', 'image/gif').
  #               rejecting('text/plain', 'text/xml') }
  # it { should validate_attachment_size(:photo).
  #               less_than(5.megabytes) }

end
