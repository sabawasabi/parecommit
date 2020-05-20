class Target < ApplicationRecord
  # Validations

  # Associations
  belongs_to :user
  has_many :matchs
end
