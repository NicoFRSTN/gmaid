class AddFieldsToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :gmail_id, :string
    add_column :messages, :received_at, :string
  end
end
