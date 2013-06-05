# encoding: utf-8

class Newsletter < ActiveRecord::Base
  attr_accessible :body, :name, :category_ids

  has_and_belongs_to_many :categories

  validates_presence_of :name, :body
  validate :at_least_one_category

private

  def at_least_one_category
    errors.add(:categories, I18n.t('activerecord.errors.newsletters.at_least_one_category')) if (categories & Category.all).count < 1
  end

end
