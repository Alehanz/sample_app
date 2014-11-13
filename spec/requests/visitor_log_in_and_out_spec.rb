require 'rails_helper'

feature "Visitor logs in and logs out" do
  scenario "render template new" do
    visit login_path

    page { should render_template('new') }
  end

  scenario "invalid email and password" do
    visit login_path

    fill_in 'Email', with: nil
    fill_in 'Password', with: nil
    click_button 'Log in'

    page { should render_template('new') }
  end

  scenario "valid email and password" do
    user = User.create(name: "Ivan", 
                       email: "test@example.com",
                       password: "foobar",
                       password_confirmation: "foobar")
    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Log out')
  end
  
  scenario "user log out" do
    user = User.create(name: "Ivan", 
                       email: "test@example.com",
                       password: "foobar",
                       password_confirmation: "foobar")
    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Log out'
    expect(page).to have_content('Log in')
  end
end
