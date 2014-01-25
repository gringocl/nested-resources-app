require "test_helper"

feature "State Routes" do
  scenario "Visit a State Index Page" do
    visit states_path
    page.must_have_content "Listing states"
    page.must_have_content states(:FL)
    page.must_have_content states(:WA)
    page.must_have_content states(:NC)
    page.must_have_content states(:HI)
    page.must_have_content states(:LA)
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
