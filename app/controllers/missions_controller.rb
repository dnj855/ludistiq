class MissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_and_zone
  before_action :authorize_event_admin!
  before_action :set_mission, only: %i[edit update destroy]

  def index
    @missions = @zone.missions.order(:start_time)
  end

  def new
    @mission = @zone.missions.new
  end

  def edit
  end

  def create
    @mission = @zone.missions.new(mission_params)
    if @mission.save
      redirect_to event_zone_missions_path(@event, @zone), notice: 'Mission créée avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mission.update(mission_params)
      redirect_to event_zone_missions_path(@event, @zone), notice: 'Mission mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mission.destroy
    redirect_to event_zone_missions_path(@event, @zone), notice: 'Mission supprimée avec succès.', status: :see_other
  end

  private

  def set_event_and_zone
    @event = Event.find(params[:event_id])
    @zone = @event.zones.find(params[:zone_id])
  end

  def set_mission
    @mission = @zone.missions.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:name, :description, :start_time, :end_time)
  end
end
