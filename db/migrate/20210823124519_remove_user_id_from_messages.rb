class RemoveUserIdFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :user_id
  end
end
