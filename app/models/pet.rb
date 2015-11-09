class Pet < ActiveRecord::Base
  validates :name, :species, :gender, :age, :weight, presence: true
  validates :weight, :numericality => { :greater_than_or_equal_to => 1 }
end
