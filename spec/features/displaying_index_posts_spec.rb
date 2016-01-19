require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays the correct created job information' do
    job_one = create(:post, caption: 'This is post one')
    job_two = create(:post, caption: 'this is the second post')

    visit '/'
    expect(page).to have_content('This is post one')
    expect(page).to have_content('this is the second post')
    expect(page).to have_css("img[src*='coffee']")
  end
end
