require 'rails_helper'

RSpec.feature "comments are linked to users", type: :feature do
  scenario "Can create a comment" do

    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "Dob", with: "1992-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"
    #---------------------

    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"

    #--------------------

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    #--------------------

    click_link "Log out"

    #---------------------

    click_button "Sign Up"
    fill_in "Name", with: "Jane Doe"
    fill_in "Email", with: "janedoe@email.com"
    fill_in "Dob", with: "1994-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    #-----------------------

    fill_in "Email", with: "janedoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"

    #----------------------

    click_button "Create Comment"
    expect(page).to have_content("Jane Doe")

  end
end