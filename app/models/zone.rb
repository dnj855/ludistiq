# frozen_string_literal: true

class Zone < ApplicationRecord
  belongs_to :event
  has_many :games
  has_many :missions, dependent: :destroy
end
