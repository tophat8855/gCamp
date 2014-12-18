require 'rails_helper'

feature 'CRUDing users' do
  scenario "User creates a user" do
    visit users_path
    click_on "New User"
    fill_in "First name", with: "User"
    fill_in "Last name", with: "1"
    fill_in "Email", with: "fake@email.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_on "Create User"

    expect(page).to have_content("User 1")
    expect(page).to have_content("fake@email.com")
  end

  scenario "User views a user" do
    User.create!(
      first_name: "Jane",
      last_name: "Doe",
      email: "jane@doe.com",
      password: "123",
      password_confirmation: "123",
    )

    visit users_path
    click_on "Jane Doe"
    expect(page).to have_content("First name Jane")
    expect(page).to have_content("Last name Doe")
    expect(page).to have_content("Email jane@doe.com")
  end

  scenario 'User edits an user' do
    User.create!(
      first_name: "Jane",
      last_name: "Doe",
      email: "jane@doe.com",
      password: "123",
      password_confirmation: "123",
    )

    visit users_path
    click_on "Edit"
    fill_in "First name", with: "Janet"
    fill_in "Last name", with: "Surname"
    fill_in "Email", with: "anon@anon.com"
    click_on "Update User"

    expect(page).to have_content("Janet Surname")
    expect(page).to have_content("anon@anon.com")
    expect(page.current_path).to eq(users_path)
  end

  scenario 'User deletes a user' do
    User.create!(
    first_name: "Joe",
    last_name: "Schmoe",
    email: "fake@fake.com",
    password: "123",
    password_confirmation: "123",
    )

    visit users_path
    click_on "Edit"
    click_on "Delete"

    expect(page).to have_no_content("Joe")
    expect(page.current_path).to eq(users_path)
  end

end
