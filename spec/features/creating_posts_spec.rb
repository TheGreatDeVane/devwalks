require 'rails_helper.rb'
# visit the root route
feature 'Creating posts' do 
  scenario 'can create job' do
    visit '/'
# click on a button to create a new post
    click_link 'New Post'
# fill out the bits of the form that we need. 
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'caption'
# click the submit button
    click_button 'Create Post'
# expect the page that we’re sent to to have specific text 
    expect(page).to have_content('caption')
# expect the page to contain our photo.
    expect(page).to have_css("img[src*='coffee.jpg']")
  end
  
  it 'needs an image to create post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'No picture'
    click_button 'Create Post'
    expect(page).to have_content('You need an image to create a post')
  end
end
