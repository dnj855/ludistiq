class Game < ApplicationRecord
  belongs_to :event
  has_many :skills, dependent: :destroy
  has_many :users, through: :skills
end
