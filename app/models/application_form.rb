class ApplicationForm < ActiveRecord::Base
  phony_normalize :phone, default_country_code: 'US'

  validates_plausible_phone :phone, presence: true, with: /\A\+\d+/
  validates :zip, zipcode: {country_code: :us}
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, on: :create }
  validates :name, :street_address, :city, :information, presence: true

end
