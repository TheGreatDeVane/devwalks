require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in "User name", with: 'devane'
    fill_in "Email", with: 'ad.mgld50@gmail.com'
    fill_in "Password", with: 'password', match: :first
    fill_in "Password confirmation", with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
  scenario 'requires username to create an account' do
    fill_in "Email", with: 'ad.mgld50@gmail.com' 
    fill_in "Password", with: 'password', match: :first
    fill_in "Password confirmation", with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end
  scenario 'requires username to be more than 4 characters' do
    fill_in 'User name', with: 'a'
    fill_in 'Email', with: 'ad.mgld50@gmail.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("minimum is 4 characters")
  end
  scenario 'requires username to be less than 12 characters' do
    fill_in 'User name', with: 'a' * 13
    fill_in 'Email', with: 'asdf@asdf.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("maximum is 12 characters")
  end
end
