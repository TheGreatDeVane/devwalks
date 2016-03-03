require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end
  scenario 'can login from index page using navbar' do
    #visit index page
    visit '/'
    #expect page to not have new post link
    expect(page).to_not have_content('New Post')
    #click login
    click_link 'Login'
    #fill in form
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'testpass'
    #click submit
    click_button 'Log in'
    #expect page to have "signed in successfully"
    expect(page).to have_content('Signed in successfully')
    #expect login/register link to disappear
    expect(page).to_not have_content('Login')
    expect(page).to_not have_content('Register')
    #expect logout to appear
    expect(page).to have_content('Logout')
  end
  scenario 'can logout once logged in' do
    # visit the index
    visit '/'
    # click the login link
    click_link 'Login'
    # fill in form
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'testpass'
    # click the login button
    click_button 'Log in'
    # Click the logout link
    click_link 'Logout'
    # expect the page to have content "signed out successfully"
		expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
  scenario "can't view index posts when logged out" do
    # visit root
		visit '/'
		# expect "you need to sign in or sign up before continuing"
		expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
	scenario 'cannot create a post without logging in' do
		#visit new post action
		visit new_post_path
		#expect "you need to sign in"
		expect(page).to have_content("You need to sign in or sign up before continuing.")
	end
end
		
