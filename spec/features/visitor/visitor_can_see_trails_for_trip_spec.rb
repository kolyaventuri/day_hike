require 'rails_helper'

describe 'As a user' do
  context 'when I visit the trips index' do
    before(:each) do
      DatabaseCleaner.clean
    end

    after(:each) do
      DatabaseCleaner.clean
    end
    scenario 'I should see a list of trips' do
      num_gen_trips = 3

      trips = create_list(:trip, num_gen_trips)

      visit trips_path

      within('.trips') do
        trip_lis = all('li')
        expect(trip_lis.length).to be(num_gen_trips)
        expect(page).to have_link(trips.first.name)
      end
    end
  end
end