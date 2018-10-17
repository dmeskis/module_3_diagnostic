require 'rails_helper'

feature "User can find stations by zip code" do
  scenario "user searches zip code and a list of stations within 6 miles appears" do
    visit "/"
    fill_in "zip", with: 80203
    click_on "Locate"
    expect(current_path).to eq("/search")

    within(first(".station")) do
      expect(page).to have_css(".distance")
      expect(page).to have_css(".type")
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".access-times")
    end
    expect(page).to have_css('.station', count: 10)
  end
end


# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
