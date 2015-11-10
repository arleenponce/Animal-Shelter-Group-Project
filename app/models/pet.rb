class Pet < ActiveRecord::Base

  validates :name, :species, :gender, :age, :weight, presence: true
  validates :weight, :numericality => { :greater_than_or_equal_to => 1 }

  has_many :pet_images, :dependent => :destroy

  accepts_nested_attributes_for :pet_images, :reject_if => lambda { |t| t['pet_image'].nil? }


end
