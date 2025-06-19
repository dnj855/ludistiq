# frozen_string_literal: true

class Mission < ApplicationRecord
  belongs_to :zone
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
end
