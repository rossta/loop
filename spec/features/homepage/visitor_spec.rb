require "rails_helper"

feature "VisitHomepage" do
  scenario "the test is sound" do
    visit root_path
    expect(page).to have_content "Loop"
    expect(page).not_to have_content "Goobye All!"
  end
end
