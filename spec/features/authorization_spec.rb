require 'rails_helper'

feature 'authorization and authentication' do
  scenario 'user can register' do
    visit root_path
    click_on "Sign Up"

    fill_in :user_email, with: "fake@fake.com"
    fill_in :user_password, with: "abc123"
    fill_in :user_password_confirmation, with: "abc123"

    click_on "Sign up"

    expect(page).to have_content("Sign Out")
  end

  scenario 'user cannot register if password does not match confirmation' do
    visit root_path
    click_on "Sign Up"

    fill_in :user_email, with: "fake@fake.com"
    fill_in :user_password, with: "abc123"
    fill_in :user_password_confirmation, with: "123abc"

    click_on "Sign up"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'user cannot register if email or password is not provided' do
    visit root_path
    click_on "Sign Up"

    click_on "Sign up"

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'user cannot register if email is already in database' do
    visit root_path
    click_on "Sign Up"
    fill_in :user_email, with: "fake@fake.com"
    fill_in :user_password, with: "abc123"
    fill_in :user_password_confirmation, with: "abc123"
    click_on "Sign up"
    click_on "Sign Out"
    click_on "Sign Up"
    fill_in :user_email, with: "fake@fake.com"
    fill_in :user_password, with: "123"
    fill_in :user_password_confirmation, with: "123"

    click_on "Sign up"

    expect(page).to have_content("Email has already been taken")
  end

  scenario 'user can sign in with proper email and password' do
    visit root_path
    click_on "Sign Up"
    fill_in :user_email, with: "fake@fake.com"
    fill_in :user_password, with: "abc123"
    fill_in :user_password_confirmation, with: "abc123"
    click_on "Sign up"
    click_on "Sign Out"
    click_on "Sign In"
    fill_in :email, with: "fake@fake.com"
    fill_in :password, with: "abc123"

    click_on "Sign in"

    expect(page).to have_content("Sign Out")
  end

  scenario 'user can see their name when signed in' do
    visit root_path
    click_on "Sign Up"
    fill_in :user_first_name, with: "Jane"
    fill_in :user_last_name, with: "Doe"
    fill_in :user_email, with: "fake@fake.com"
    fill_in :user_password, with: "abc123"
    fill_in :user_password_confirmation, with: "abc123"
    click_on "Sign up"
    click_on "Sign Out"
    click_on "Sign In"
    fill_in :email, with: "fake@fake.com"
    fill_in :password, with: "abc123"

    click_on "Sign in"

    expect(page).to have_content("Jane Doe")
    expect(page).to have_content("Sign Out")
  end

  scenario 'user cannot sign in with wrong password data' do
    visit root_path
    click_on "Sign Up"
    fill_in :user_first_name, with: "Jane"
    fill_in :user_last_name, with: "Doe"
    fill_in :user_email, with: "fake@fake.com"
    fill_in :user_password, with: "abc123"
    fill_in :user_password_confirmation, with: "abc123"
    click_on "Sign up"
    click_on "Sign Out"
    click_on "Sign In"
    fill_in :email, with: "fake@fake.com"
    fill_in :password, with: "123"

    click_on "Sign in"

    expect(page).to have_content("Username / password combination is invalid")
  end

  scenario 'user cannot sign in with email not in database' do
    visit root_path
    click_on "Sign Up"
    fill_in :user_first_name, with: "Jane"
    fill_in :user_last_name, with: "Doe"
    fill_in :user_email, with: "fake@fake.com"
    fill_in :user_password, with: "abc123"
    fill_in :user_password_confirmation, with: "abc123"
    click_on "Sign up"
    click_on "Sign Out"
    click_on "Sign In"
    fill_in :email, with: "jane@doe.com"
    fill_in :password, with: "abc123"

    click_on "Sign in"

    expect(page).to have_content("Username / password combination is invalid")
  end

  scenario 'user cannot sign in with empty form' do
    visit root_path
    click_on "Sign In"

    click_on "Sign in"

    expect(page).to have_content("Username / password combination is invalid")
  end
end
