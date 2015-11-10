class Pet < ActiveRecord::Base
  has_and_belongs_to_many :breeds

  validates :name, :species, :gender, :age, :weight, presence: true
  validates :weight, :numericality => { :greater_than_or_equal_to => 1 }
end
