require 'rails_helper'

feature 'user posts microposts' do
  before(:each) do
    @user = create(:activated)
    @user2 = create(:activated)
    @micropost = create(:micropost, :user => @user)
  end

  scenario 'user goes to the microposts page' do
    visit root_path
    log_in(@user)

    visit root_path

    expect(page).to have_selector("input[type=submit][value='Post']")
  end

  scenario 'user sees his microposts' do
    visit root_path
    log_in(@user)

    visit user_path(@user)

    expect(page).to have_content('Lorem ipsum')
  end

  scenario 'user adds micropost' do
    visit root_path
    log_in(@user)

    visit root_path
    fill_in('micropost_content', :with => 'Test')
    click_button 'Post'

    expect(page).to have_content('Micropost created')
  end

  scenario 'user deletes micropost' do
    visit root_path
    log_in(@user)

    visit root_path
    click_link 'delete'
    expect(page).to have_content('Micropost deleted')
  end

  scenario 'unable to delte other user microposts' do
    visit root_path
    log_in(@user)

    visit user_path(@user2)

    expect(page).not_to have_link('delete')
  end
end
