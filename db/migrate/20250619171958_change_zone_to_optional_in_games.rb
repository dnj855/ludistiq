class ChangeZoneToOptionalInGames < ActiveRecord::Migration[7.1]
  def change
    change_column_null :games, :zone_id, true
  end
end
