class Trip < ApplicationRecord
  validates_presence_of :name

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def distance
    trails.sum(:length)
  end
end
