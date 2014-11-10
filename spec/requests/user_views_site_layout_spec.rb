require 'rails_helper'

feature 'User views site layout' do
  scenario 'properly' do
    visit root_path

    expect(page).to have_link("Home", :href=>root_path)
    expect(page).to have_link("Help", :href=>help_path)
    expect(page).to have_link("About", :href=>about_path)
    expect(page).to have_link("Contact", :href=>contact_path)
    expect(page).to have_link("Sign up now!", :href=>signup_path)
  end
end
