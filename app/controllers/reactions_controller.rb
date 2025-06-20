# app/controllers/reactions_controller.rb
class ReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message_and_event

  def create
    # On cherche une réaction existante ou on en initialise une nouvelle
    @reaction = @message.reactions.find_or_initialize_by(user: current_user)
    @reaction.emoji = '👍' # Pour l'instant, on code en dur le "like"

    return unless @reaction.save

    respond_to_turbo_stream
  end

  def destroy
    @reaction = @message.reactions.find_by(user: current_user)
    @reaction&.destroy
    respond_to_turbo_stream
  end

  private

  def set_message_and_event
    @message = Message.find(params[:message_id])
    @event = @message.event
  end

  def respond_to_turbo_stream
    respond_to do |format|
      # On renvoie un Turbo Stream pour mettre à jour la carte du message
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@message)
      end
    end
  end
end
