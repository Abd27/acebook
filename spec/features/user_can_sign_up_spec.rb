require 'rails_helper'

RSpec.feature "Registration", type: :feature do
  scenario "Can sign up as a user" do

    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    # fill_in "Dob", with: 01/01/1992 
    fill_in "Password", with: "password"
    #fill_in "confirm", with: "password"
    click_button "Create Account"

    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Success: New Account Created") #flash message on index page
    expect(page).to have_content("Welcome to Acebook")
    #expect(User.first.name).to_eq("John Doe")
  end
end