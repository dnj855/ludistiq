# frozen_string_literal: true

class CreateMissions < ActiveRecord::Migration[7.1]
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :zone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
