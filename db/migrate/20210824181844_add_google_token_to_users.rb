class AddGoogleTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :google_token, :string
  end
end
