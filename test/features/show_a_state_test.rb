require "test_helper"

feature "Show A State" do
  scenario "Visits a State Page" do
    visit states_path
    page.must_have_content "Listing states"
  end
end
