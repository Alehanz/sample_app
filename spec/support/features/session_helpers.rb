module Features
  module SessionHelpers
    def log_in(user)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    def sign_up_with(name, email, password)
      visit signup_path
      fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Confirmation', with: password
      click_button 'Create my account'
    end
  end
end
