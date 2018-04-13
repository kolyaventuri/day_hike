require 'rails_helper'

describe 'As a user' do
  context 'when I visit a trip show page' do
    before(:each) do
      DatabaseCleaner.clean
      @trip = create(:trip)
      create_list(:trail, 3).each do |trail|
        TripTrail.create!(trip: @trip, trail: trail)
      end
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    scenario 'I can see the list of trails for that trip' do
      visit trip_path(@trip)

      expect(page).to have_content(@trip.name)
    end
  end
end