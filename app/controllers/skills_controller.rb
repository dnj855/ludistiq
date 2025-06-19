# frozen_string_literal: true

class SkillsController < ApplicationController
  # On garde l'include pour la méthode `dom_id`
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  # On ajoute un before_action pour trouver le skill lors d'un 'update'
  before_action :set_skill, only: [:update]

  # Gère la création d'une NOUVELLE compétence
  def create
    @skill = current_user.skills.new(skill_params)

    if @skill.save
      respond_with_skill_row
    else
      # Gérer le cas où la sauvegarde échoue
      head :unprocessable_entity
    end
  end

  # Gère la mise à jour d'une compétence EXISTANTE
  def update
    if @skill.update(skill_params)
      respond_with_skill_row
    else
      # Gérer le cas où la mise à jour échoue
      head :unprocessable_entity
    end
  end

  private

  def set_skill
    # On s'assure que l'utilisateur ne modifie que ses propres compétences
    @skill = current_user.skills.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:game_id, :level)
  end

  # Méthode privée pour envoyer la même réponse Turbo Stream
  def respond_with_skill_row
    @game = @skill.game
    render turbo_stream: turbo_stream.update(
      dom_id(@game, 'skill'),
      partial: 'skills/skill_row',
      locals: { game: @game, my_skill: @skill }
    )
  end
end
