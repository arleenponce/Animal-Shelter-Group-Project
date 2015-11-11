class Breed < ActiveRecord::Base
  has_and_belongs_to_many :pets

  # validates :breed_name, :presence => true
end
