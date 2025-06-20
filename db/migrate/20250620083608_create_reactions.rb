class CreateReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true
      t.string :emoji

      t.timestamps
    end

    add_index :reactions, %i[user_id message_id], unique: true
  end
end
