# frozen_string_literal: true

class CreateZones < ActiveRecord::Migration[7.1]
  def change
    create_table :zones do |t|
      t.string :name
      t.text :description
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
