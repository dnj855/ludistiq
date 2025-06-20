class Message < ApplicationRecord
  belongs_to :event
  belongs_to :sender, class_name: 'User'
  belongs_to :parent, class_name: 'Message', optional: true

  has_many :replies, class_name: 'Message', foreign_key: 'parent_id', dependent: :destroy
  has_many :reactions, dependent: :destroy
end
