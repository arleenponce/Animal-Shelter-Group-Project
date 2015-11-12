class ApplicationForm < ActiveRecord::Base
  phony_normalize :phone, default_country_code: 'US'

  validates_plausible_phone :phone, presence: true, with: /\A\+\d+/
  validates :zip, zipcode: {country_code: :us}

  validates :name, :email, :street_address, :city, :information, presence: true

end
