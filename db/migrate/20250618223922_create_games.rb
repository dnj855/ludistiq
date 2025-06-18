# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.references :event, null: false, foreign_key: true
      t.string :title
      t.integer :bgg_id
      t.text :description
      t.integer :min_players
      t.integer :max_players
      t.integer :duration
      t.string :image_url
      t.string :owner
      t.integer :copies_count

      t.timestamps
    end
  end
end
