require 'rails_helper'

feature 'User can visit static pages' do
  scenario 'Viewing the Home page' do
    visit '/home'

    expect(page).to have_content('Home')
  end

  scenario 'Viewing the About page' do
    visit '/about'

    expect(page).to have_content('About')
  end

  scenario 'Viewing the Hekp page' do
    visit '/help'

    expect(page).to have_content('Help')
  end

end
