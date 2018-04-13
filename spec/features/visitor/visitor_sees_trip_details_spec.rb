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

    context 'I can see trail distances' do
      before(:each) do
        @trip = create(:trip)
        @trails = create_list(:trail, 3)
        @trails.first.length = 5
        @trails.second.length = 10
        @trails.last.length = 15

        @trails.each do |trail|
          trail.save
          TripTrail.create!(trip: @trip, trail: trail)
        end
      end

      scenario 'average' do
        visit trip_path(@trip)

        expect(page).to have_content("Average distance: #{@trip.average_distance}")
      end

      scenario 'shortest' do
        visit trip_path(@trip)

        expect(page).to have_content("Shortest distance: #{@trip.shortest_distance}")
      end

      scenario 'longest' do
        visit trip_path(@trip)

        expect(page).to have_content("Longest distance: #{@trip.longest_distance}")
      end
    end
  end
end