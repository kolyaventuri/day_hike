require 'rails_helper'

describe Trip, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to have_many(:trip_trails) }
  it { is_expected.to have_many(:trails).through(:trip_trails) }

  describe 'Methods' do
    before(:each) do
      DatabaseCleaner.clean
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    context '#distance' do
      it 'should be able to calculate the total distance' do
        trip = create(:trip)
        trails = create_list(:trail, 3)
        trails.each do |trail|
          TripTrail.create!(trip: trip, trail: trail)
        end
        expect(trip.distance).to be(15)
      end
    end

    context '#average_distance' do
      it 'should calculate the average trail distance' do
        trip = create(:trip)
        trails = create_list(:trail, 3)
        trails.first.length = 5
        trails.second.length = 10
        trails.last.length = 15

        trails.each do |trail|
          trail.save
          TripTrail.create!(trip: trip, trail: trail)
        end
        expect(trip.average_distance).to be(10)
      end
    end

    context '#shortest_distance' do
      it 'should calculate the shortest trail distance' do
        trip = create(:trip)
        trails = create_list(:trail, 3)
        trails.first.length = 5
        trails.second.length = 10
        trails.last.length = 15

        trails.each do |trail|
          trail.save
          TripTrail.create!(trip: trip, trail: trail)
        end
        expect(trip.shortest_distance).to be(5)
      end
    end

    context '#longest_distance' do
      it 'should calculate the longest trail distance' do
        trip = create(:trip)
        trails = create_list(:trail, 3)
        trails.first.length = 5
        trails.second.length = 10
        trails.last.length = 15

        trails.each do |trail|
          trail.save
          TripTrail.create!(trip: trip, trail: trail)
        end
        expect(trip.longest_distance).to be(15)
      end
    end
  end
end
