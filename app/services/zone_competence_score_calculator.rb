# frozen_string_literal: true

class ZoneCompetenceScoreCalculator
  # On utilise des 'keyword arguments' pour rendre l'appel plus explicite.
  def self.call(user:, zone:)
    # On récupère les jeux présents dans la zone spécifiée.
    games_in_zone = zone.games

    # C'est une bonne pratique de gérer le cas où il n'y a pas de jeux.
    return 0 if games_in_zone.empty?

    # On compte le nombre de jeux que l'utilisateur maîtrise (connaisseur ou expert).
    # La logique est identique à celle qui était dans le modèle User.
    known_games_count = user.skills.where(
      game_id: games_in_zone.pluck(:id),
      level: %i[connaisseur expert]
    ).count

    # On calcule et on arrondit le score.
    (known_games_count.to_f / games_in_zone.count * 100).round
  end
end
