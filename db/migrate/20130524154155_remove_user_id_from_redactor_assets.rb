class RemoveUserIdFromRedactorAssets < ActiveRecord::Migration
  def change
    remove_column :redactor_assets, :user_id
  end
end
