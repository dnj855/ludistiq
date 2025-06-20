# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  # ON RETIRE le before_action restrictif d'ici.
  # La permission sera vérifiée au cas par cas dans les actions.

  def index
    @messages = @event.messages.where(parent_id: nil).order(created_at: :desc)
  end

  def show
    # TODO: Ajouter la logique d'autorisation pour la conversation privée.
    @message = @event.messages.find(params[:id])
    # On récupère tous les utilisateurs qui ont participé au thread
    participant_ids = [@message.sender_id] + @message.replies.pluck(:sender_id)
    # Si l'utilisateur courant n'est pas dans la liste, on le refuse.
    unless participant_ids.include?(current_user.id)
      redirect_to event_messages_path(@event), alert: "Vous n'avez pas accès à cette conversation."
      return
    end
    @replies = @message.replies.order(:created_at)
  end

  def new
    @message = @event.messages.new(parent_id: params[:parent_id])
    if @message.parent_id.blank? && !current_user_is_event_admin?
      redirect_to event_messages_path(@event), alert: "Vous n'avez pas les droits pour publier un message."
      return
    end

    if turbo_frame_request?
      # Si c'est une requête Turbo, on rend le partiel qu'on vient de créer.
      render partial: 'reply', locals: { message: @message, event: @event }
    else
      # Sinon, on rend la page complète (comportement normal pour la page /new)
      render :new
    end
  end

  def create
    @message = @event.messages.new(message_params)
    @message.sender = current_user

    # VÉRIFICATION DES PERMISSIONS :
    # Si le message n'a pas de parent (c'est un nouveau sujet) ET
    # que l'utilisateur n'est pas admin, alors on refuse.
    if @message.parent_id.blank? && !current_user_is_event_admin?
      redirect_to event_messages_path(@event), alert: "Vous n'avez pas les droits pour publier un message."
      return # On arrête l'exécution ici
    end

    if @message.save
      if @message.parent_id.present?
        redirect_to event_message_path(@event, @message.parent), notice: 'Réponse envoyée.'
      else
        redirect_to event_messages_path(@event), notice: 'Message publié.'
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def message_params
    params.require(:message).permit(:content, :parent_id)
  end
end
