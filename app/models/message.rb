class Message < ApplicationRecord
  # Validations
  validates :message, presence: true

  # Associations
  belongs_to :user
  belongs_to :match
end
