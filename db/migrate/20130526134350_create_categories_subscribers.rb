class CreateCategoriesSubscribers < ActiveRecord::Migration
  def change
    create_table :categories_subscribers do |t|
      t.integer :category_id
      t.integer :subscriber_id
    end
  end
end
