# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :event
  belongs_to :zone, optional: true
  has_many :skills, dependent: :destroy
  has_many :users, through: :skills
end
