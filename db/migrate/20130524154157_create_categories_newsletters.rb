class CreateCategoriesNewsletters < ActiveRecord::Migration
  def change
    create_table :categories_newsletters do |t|
      t.integer :category_id
      t.integer :newsletter_id
    end
  end
end
