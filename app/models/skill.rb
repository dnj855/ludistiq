# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :game

  enum :level, { ne_souhaite_pas_animer: -1, inconnu: 0, connaisseur: 1, expert: 2 }
end
