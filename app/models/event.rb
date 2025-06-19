# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :games, dependent: :destroy
  has_many :zones, dependent: :destroy
end
