class Newsletter < ActiveRecord::Base
  attr_accessible :body, :name

  validates_presence_of :name, :body
end
