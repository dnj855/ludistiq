# frozen_string_literal: true

class PublicController < ApplicationController
  def index
    # On récupère tous les événements, les plus récents en premier
    @events = Event.order(start_date: :desc)
  end

  def show
    # On récupère l'événement spécifique avec ses zones, missions et jeux.
    # L'eager loading (.includes) est crucial pour éviter les requêtes N+1.
    @event = Event.includes(zones: :missions, games: []).find(params[:id])
  end
end
