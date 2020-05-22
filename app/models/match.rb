class Match < ApplicationRecord
  # Validations

  # Associations
  belongs_to :target
  belongs_to :user
end
