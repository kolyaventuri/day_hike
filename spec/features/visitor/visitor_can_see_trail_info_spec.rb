require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit a trail show page' do
    scenario 'I can see that trails information' do
      trail = create(:trail)

      visit trail_path(trail)

      expect(page).to have_content(trail.name)
      expect(page).to have_content(trail.address)
      expect(page).to have_content("#{trail.length} miles")
    end
  end
end