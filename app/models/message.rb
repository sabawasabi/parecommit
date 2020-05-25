class Message < ApplicationRecord
  # Validations
  validates :message, presence: true

  # Associations
  belongs_to :user
  belongs_to :match

  mount_uploader :image, ImageUploader
end
