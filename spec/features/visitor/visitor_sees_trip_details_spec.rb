require 'rails_helper'

describe 'As a user' do
  context 'when I visit a trip show page' do
    before(:each) do
      DatabaseCleaner.clean
      @trip = create(:trip)
      create_list(:trails, 3).each do |trail|
        TripTrails.create!(trip: @trip, trail: trail)
      end
    end

    after(:each) do
      DatabaseCleaner.clean
    end
  end
end