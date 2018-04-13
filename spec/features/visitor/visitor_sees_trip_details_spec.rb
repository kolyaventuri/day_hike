require 'rails_helper'

describe 'As a user' do
  context 'when I visit a trip show page' do
    before(:each) do
      DatabaseCleaner.clean
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    scenario 'I can see the list of trails for that trip' do
      trip = create(:trip)
      trails = create_list(:trail, 3)
      trails.each do |trail|
        TripTrail.create!(trip: trip, trail: trail)
      end

      visit trip_path(trip)

      expect(page).to have_content(trip.name)

      within('.trails') do
        lis = all('li')
        expect(lis.length).to be(3)

        lis.each_with_index do |li, index|
          within(li) do
            expect(page).to have_content("Name: #{trails[index].name}")
            expect(page).to have_content("Address: #{trails[index].address}")
            expect(page).to have_content("Length: #{trails[index].length} miles")
          end
        end
      end
    end

    scenario 'I can see the total planned hiking distance' do
      trip = create(:trip)
      trails = create_list(:trail, 3)
      trails.each do |trail|
        TripTrail.create!(trip: trip, trail: trail)
      end

      visit trip_path(trip)

      expect(page).to have_content("Total planned distance: #{trip.distance} miles")
    end

    scenario 'I can see the average hiking distance per trails' do
      
    end
  end
end