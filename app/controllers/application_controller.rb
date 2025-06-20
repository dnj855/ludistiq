# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user_is_event_admin?

  private

  def authorize_event_admin!
    # On peut maintenant centraliser cette méthode
    participation = current_user.participations.find_by(event: @event)
    return if participation&.admin?

    redirect_to root_path, alert: "Vous n'avez pas les droits d'administrateur pour cet événement."
  end

  # Méthode d'aide pour vérifier le rôle de l'utilisateur pour l'événement en cours
  def current_user_is_event_admin?
    current_user.participations.find_by(event: @event)&.admin?
  end
end
