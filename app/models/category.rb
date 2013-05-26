class Category < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :newsletters
  has_and_belongs_to_many :subscribers

  validates :name, :presence => true, :uniqueness => true
end
