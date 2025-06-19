# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations
  has_many :skills, dependent: :destroy
  has_many :games, through: :skills
  has_many :assignments, dependent: :destroy
  has_many :missions, through: :assignments

  def admin?
    participations.any?(&:admin?)
  end

  def competence_score_for(zone)
    games_in_zone = zone.games
    return 0 if games_in_zone.empty?

    known_games_count = skills.where(game_id: games_in_zone.pluck(:id), level: %i[connaisseur expert]).count
    (known_games_count.to_f / games_in_zone.count * 100).round
  end
end
