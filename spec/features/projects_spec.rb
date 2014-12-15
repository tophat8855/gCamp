require 'rails_helper'

feature 'CRUDing projects' do
  scenario "User creates a project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Project 1"
    click_on "Create Project"

    expect(page).to have_content("Project 1")
  end

  scenario "User views a project" do
    Project.create!(
    name: "Project 1",
    )

    visit projects_path
    click_on "Project 1"

    expect(page).to have_content("Project 1")
  end

  scenario 'User edits a project' do
    Project.create!(
    name: "Project 1",
    )

    visit projects_path
    click_on "Project 1"
    click_on "Edit"
    fill_in "Name", with: "Project 2"

    click_on "Update project"

    expect(page).to have_content("Project 2")
  end

  scenario 'User deletes a project' do
    Project.create!(
    name: "Project 1",
    )

    visit projects_path
    click_on "Project 1"
    click_on "Delete"

    expect(page).to have_no_content("Project 1")

  end

end
