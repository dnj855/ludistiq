# frozen_string_literal: true

class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
