require 'rails_helper'

feature 'User can visit static pages' do
  scenario 'Viewing the Home page' do
    visit root_path

    expect(page).to have_content('Sample App')
  end

  scenario 'Viewing the About page' do
    visit '/about'

    expect(page).to have_content('About')
  end

  scenario 'Viewing the Help page' do
    visit '/help'

    expect(page).to have_content('Help')
  end

end
