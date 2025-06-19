# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def bgg_search
    @results = BggApiService.search(params[:query])
    # On s'assure que le partial aura bien accès à @event pour construire les URLs des liens
    render turbo_stream: turbo_stream.update('bgg_search_results',
                                             partial: 'games/search_results',
                                             locals: { results: @results, event: @event })
  end

  def index
    @games = @event.games.order(:title)
  end

  def new
    if params[:bgg_id].present?
      # Si on a un ID BGG, on pré-remplit le formulaire
      game_details = BggApiService.find_game(params[:bgg_id])
      @game = @event.games.new(game_details)
    else
      # Sinon, on affiche un formulaire vide (pour la recherche initiale ou l'ajout manuel)
      @game = @event.games.new
    end
  end

  def create
    @game = @event.games.new(game_params)
    if @game.save
      redirect_to event_games_path(@event), notice: 'Jeu ajouté avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :min_players, :max_players, :duration, :image_url, :owner,
                                 :copies_count, :bgg_id, :zone_id)
  end
end
