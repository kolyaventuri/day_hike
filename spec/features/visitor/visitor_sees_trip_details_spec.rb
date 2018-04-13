require 'rails_helper'

describe 'As a user' do
  context 'when I visit a trip show page' do
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

    scenario 'I can see the list of trails for that trip' do
      visit trip_path(@trip)

      expect(page).to have_content(@trip.name)

      within('.trails') do
        lis = all('li')
        expect(lis.length).to be(3)

        li.each_with_index do |li, index|
          within(li) do
            expect(page).to have_content("Name: #{@trails[index].name}")
            expect(page).to have_content("Address: #{@trails[index].address}")
            expect(page).to have_content("Length: #{@trails[index].length} miles")
          end
        end
      end
    end
  end
end