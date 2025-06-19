# frozen_string_literal: true

class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_zone_and_mission
  before_action :authorize_event_admin!

  def create
    @user = User.find(params[:user_id])
    @assignment = @mission.assignments.new(user: @user)

    respond_to do |format|
      if @assignment.save
        format.turbo_stream { render 'assignments/update_row' }
      else
        # Gérer l'erreur si besoin
      end
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @user = @assignment.user
    @assignment.destroy

    respond_to do |format|
      format.turbo_stream { render 'assignments/update_row' }
    end
  end

  private

  def set_event_zone_and_mission
    @event = Event.find(params[:event_id])
    @zone = @event.zones.find(params[:zone_id])
    @mission = @zone.missions.find(params[:mission_id])
  end
end
