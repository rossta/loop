require "rails_helper"

feature "Accounts: login" do
  scenario "from homepage" do
    visit root_path

    save_and_open_page
    click_link "Login"

    expect(page).to have_content("rossta")
  end
end
