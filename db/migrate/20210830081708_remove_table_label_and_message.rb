class RemoveTableLabelAndMessage < ActiveRecord::Migration[6.1]
  def change
    drop_table :labels
    drop_table :messages
  end
end
