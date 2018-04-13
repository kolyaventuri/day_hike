class Trip < ApplicationRecord
  validates_presence_of :name

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def distance
    trails.sum(:length)
  end

  def average_distance
    trails.average(:length).to_i
  end

  def shortest_distance
    trails.minimum(:length)
  end

  def longest_distance
    trails.maximum(:length)
  end
end
