# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_global_admin!, only: %i[index new create]
  before_action :set_event, only: %i[show edit update destroy participants my_skills]
  before_action :authorize_event_admin!, only: %i[edit update destroy participants]

  # GET /events or /events.json
  def index
    @events = current_user.admin? ? Event.all : current_user.events
  end

  # GET /events/1 or /events/1.json
  def show; end

  # GET /events/new
  def new
    @event = Event.new
  end

  def participants; end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        @event.participations.create!(user: current_user, role: :admin)
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_path, status: :see_other, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_skills
    @games = @event.games.order(:title)
    @my_skills = current_user.skills.where(game_id: @games.pluck(:id)).index_by(&:game_id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end

  def authorize_global_admin!
    redirect_to root_path, alert: 'Accès non autorisé.' unless current_user.admin?
  end
end
