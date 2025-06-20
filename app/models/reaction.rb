class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :emoji, presence: true, inclusion: { in: ['👍', '✓'] }
end
