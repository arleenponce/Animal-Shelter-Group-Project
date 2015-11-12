class ApplicationForm < ActiveRecord::Base
  phony_normalize :phone, default_country_code: 'US'

  validates_plausible_phone :phone, presence: true, with: /\A\+\d+/
  validates :name, :email, :street_address, :city, :zip, :information, presence: true

end
