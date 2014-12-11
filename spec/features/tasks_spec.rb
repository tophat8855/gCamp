require 'rails_helper'

feature 'CRUDing tasks' do
  scenario "User creates a task" do
    visit tasks_path
    click_on "New Task"
    fill_in "Description", with: "Task 1"
    fill_in "Due date", with: "2014-12-12"
    click_on "Create Task"

    expect(page).to have_content("Task 1")
    expect(page).to have_content("Completed: false")
    expect(page).to have_content("Due Date: 2014-12-12")
  end

  scenario "User views a task" do
    Task.create!(
    description: "Send Christmas cards",
    complete: false,
    due_date: "2014-12-12"
    )

    visit tasks_path
    click_on "Show"
    expect(page).to have_content("Send Christmas cards")
    expect(page).to have_content("Completed: false")
    expect(page).to have_content("Due Date: 2014-12-12")
  end

  scenario 'User edits an event' do
    Task.create!(
    description: "Task 1",
    complete: false,
    due_date: "2014-12-11"
    )

    visit tasks_path
    click_on "Edit"
    fill_in "Description", with: "Task 2"
    fill_in "Due date", with: "2014-12-12"
    check "Complete"
    click_on "Update Task"

    expect(page).to have_content("Task 2")
    expect(page).to have_content("Completed: true")
    expect(page).to have_content("Due Date: 2014-12-12")
  end

  scenario 'User deletes a task' do
    Task.create!(
    description: "Birthday",
    )

    visit tasks_path
    click_on "Delete"

    expect(page).to have_no_content("Birthday")
    expect(page.current_path).to eq(tasks_path)
  end

end
