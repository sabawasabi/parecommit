class Match < ApplicationRecord
  # Validations

  # Associations
  belongs_to :user
  belongs_to :target
end
