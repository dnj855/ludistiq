# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations
  has_many :skills, dependent: :destroy
  has_many :games, through: :skills

  def admin?
    participations.any?(&:admin?)
  end
end
