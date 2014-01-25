require "test_helper"

feature "State Routes" do
  scenario "Visit a State Index Page" do
    visit states_path
    page.must_have_content "Listing states"
    page.must_have_content(states(:FL).name && states(:FL).population)
    page.must_have_content(states(:WA).name && states(:WA).population)
    page.must_have_content(states(:NC).name && states(:NC).population)
    page.must_have_content(states(:HI).name && states(:HI).population)
    page.must_have_content(states(:LA).name && states(:LA).population)
  end

  scenario "Visit a State Show Page" do
    visit states_path
    page.must_have_content "Listing states"
  end

  scenario "Visit a State New Page and Create State" do
    visit states_path
    page.must_have_content "Listing states"
  end

  scenario "Visit a State Edit Page and Update State" do
    visit states_path
    page.must_have_content "Listing states"
  end

  scenario "Destroy a State" do
    visit states_path
    page.must_have_content "Listing states"
  end

end
