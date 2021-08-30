class CreateTableMessageAndLabel < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :from
      t.string :subject
      t.datetime :date_at
      t.string :snippet
      t.string :google_id, null: false
      t.references :user

      t.timestamps
    end

    create_table :labels do |t|
      t.string :name
      t.string :google_id, null: true, index: true, unique: true
      t.string :text_color
      t.string :background_color
      t.references :user
    end

    create_table :message_labels do |t|
      t.references :message, foreign_key: true
      t.references :label, foreign_key: true
    end
  end
end
