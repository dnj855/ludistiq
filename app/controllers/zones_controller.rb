# frozen_string_literal: true

class ZonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :authorize_event_admin!
  before_action :set_zone, only: %i[edit update destroy]

  def index
    @zones = @event.zones.order(:name)
  end

  def new
    @zone = @event.zones.new
  end

  def edit; end

  def create
    @zone = @event.zones.new(zone_params)
    if @zone.save
      redirect_to event_zones_path(@event), notice: 'Zone créée avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @zone.update(zone_params)
      redirect_to event_zones_path(@event), notice: 'Zone mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @zone.destroy
    redirect_to event_zones_path(@event), notice: 'Zone supprimée avec succès.', status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_zone
    @zone = @event.zones.find(params[:id])
  end

  def zone_params
    params.require(:zone).permit(:name, :description)
  end
end
