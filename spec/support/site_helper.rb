module SiteHelpers
  def sign_in(user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button I18n.t('.devise.sessions.sign_in')
  end

  def sign_out
    Capybara.reset_sessions!
    visit destroy_user_session_path
  end
end
