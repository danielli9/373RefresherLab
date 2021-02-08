class Task < ApplicationRecord
  has_many :chores
  has_many :children, through: :chores

  validates_presence_of :name, :points
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :alphabetical, -> { order(:name) }
  scope :active, -> { where('active = ?', true) }

end
