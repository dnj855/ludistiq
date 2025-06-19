# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def authorize_event_admin!
    # On peut maintenant centraliser cette méthode
    participation = current_user.participations.find_by(event: @event)
    return if participation&.admin?

    redirect_to root_path, alert: "Vous n'avez pas les droits d'administrateur pour cet événement."
  end
end
