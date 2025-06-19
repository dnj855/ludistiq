# frozen_string_literal: true

class AddZoneToGames < ActiveRecord::Migration[7.1]
  def change
    add_reference :games, :zone, null: false, foreign_key: true
  end
end
