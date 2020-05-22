class Target < ApplicationRecord
  # Validations
  validates :target,      presence: true
  validates :explanation, presence: true
  validates :limit,       presence: true
  validates :status,      presence: true

  # Associations
  belongs_to :user
  has_many :matchs
end
