# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
end
