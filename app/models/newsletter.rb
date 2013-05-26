# encoding: utf-8

class Newsletter < ActiveRecord::Base
  attr_accessible :body, :name, :category_ids

  has_and_belongs_to_many :categories

  validates_presence_of :name, :body
  validate :at_least_one_category

private

  def at_least_one_category
    errors.add(:categories, "doit contenir au moins une catégorie") if (category_ids & Category.pluck(:id)).count < 1
  end

end
