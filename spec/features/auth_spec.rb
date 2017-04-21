require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do

    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "test.com"
      fill_in "Password", :with => "password"
      click_on "create user"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "test.com"
    end
  end
end

feature "logging in" do

  before(:each) do
    User.create(email:"test.com", password: "password")
    visit new_session_url
    fill_in "Email", with: "test.com"
    fill_in "Password", with: "password"
    click_on "sign in"
    # save_and_open_page
  end

  scenario "shows username on the homepage after login" do
    expect(page).to have_content "test.com"
  end

end

feature "logging out" do
  before(:each) do
    User.create(email:"test.com", password: "password")
    visit new_session_url
    fill_in 'Email', with: "test.com"
    fill_in "Password", with: "password"
    click_on "sign in"
    click_on "Sign Out"
    end

  scenario "begins with a logged out state" do
    expect(page).to have_content "Sign In"
  end

  scenario "doesn't show username on the homepage after logout" do
    expect(page).not_to have_content "test.com"
  end

end
