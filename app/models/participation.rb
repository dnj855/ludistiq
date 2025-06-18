# frozen_string_literal: true

class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum :role, { benevole: 0, admin: 1 }
end
