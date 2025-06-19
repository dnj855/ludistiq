# app/controllers/plannings_controller.rb
class PlanningsController < ApplicationController
  before_action :authenticate_user!

  def show
    # Grâce aux associations `has_many :through`, on récupère facilement les missions.
    # On utilise `includes(:zone)` pour éviter les requêtes N+1 et pré-charger les zones.
    @my_missions = current_user.missions.includes(zone: :event).order(:start_time)
  end
end
