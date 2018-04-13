require 'rails_helper'

describe Trip, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to have_many(:trip_trails) }
  it { is_expected.to have_many(:trails).through(:trip_trails) }

  describe 'Methods' do
    before(:each) do
      DatabaseCleaner.clean
      @trip = create(:trip)
      @trails = create_list(:trail, 3)
      @trails.each do |trail|
        TripTrail.create!(trip: @trip, trail: trail)
      end
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    context '#distance' do
      it 'should be able to calculate the total distance' do
        expect(@trip.distance).to be(15)
      end
    end
  end
end
