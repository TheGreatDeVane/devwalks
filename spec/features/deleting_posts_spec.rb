require 'rails_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: "oops i didn't mean to post this")
    user = create :user

    sign_in_with user 

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Post deleted')
    expect(page).to_not have_content("oops i didn't mean to post this")
  end
end
