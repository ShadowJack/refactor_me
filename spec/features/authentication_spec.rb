require 'rails_helper'

feature 'Authentication with devise:' do
  include Warden::Test::Helpers
  Warden.test_mode!

  after(:each) { Warden.test_reset! }


  scenario 'successfuly login via sign in form (username)' do
    user = create(:user)
    visit new_user_session_path

    fill_in 'Login', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully'
  end

  scenario 'successfuly login with new GitHub user' do

    visit root_path
    mock_auth_hash
    click_link 'Login with GitHub'

    expect(page).to have_text 'authenticated from Github'

    #OmniAuth.config.mock_auth[:github] = nil
    #OmniAuth.config.test_mode = false

  end

  scenario 'successfuly login with old GitHub user' do

    create(:user, provider: 'github', uid: '123545')

    visit root_path
    mock_auth_hash
    click_link 'Login with GitHub'

    expect(page).to have_text 'authenticated from Github'

    #OmniAuth.config.mock_auth[:github] = nil
    #OmniAuth.config.test_mode = false

  end

  scenario 'successfuly logout' do
    login_as FactoryGirl.create(:user), scope: :user

    visit root_path

    click_link 'Sign out'

    expect(page).to have_text 'Signed out'
  end


end