class Target < ApplicationRecord
  # Validations
  validates :target,      presence: true
  validates :explanation, presence: true
  validates :limit,       presence: true
  validates :status,      presence: true

  # Associations
  belongs_to :user
  has_many :matchs

  def self.search(search)
    return Target.all unless search
    Target.where('target LIKE(?)', "%#{search}%")
  end
end
