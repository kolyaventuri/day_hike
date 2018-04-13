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

      create_list(:trip, num_gen_trips)

      visit trips_path

      within('.trips') do
        trips = find('li')
        expect(trips.length).to be(num_gen_trips)
      end
    end
  end
end