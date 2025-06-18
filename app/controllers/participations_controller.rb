# frozen_string_literal: true

class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def update
    participation = Participation.find(params[:id])
    event = participation.event

    current_user_participation = current_user.participations.find_by(event: event)
    redirect_to root_path, alert: 'Accès non autorisé.' unless current_user_participation&.admin?

    if participation.update(participation_params)
      redirect_to participants_event_path(event), notice: 'Rôle mis à jour avec succès.'
    else
      redirect_to participants_event_path(event), alert: 'Erreur lors de la mise à jour du rôle.'
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:role)
  end
end
