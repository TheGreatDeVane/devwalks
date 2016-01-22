require 'rails_helper'

feature 'Editing posts' do
  background do
    job = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can edit a post' do
    fill_in 'Caption', with: "oops, didn't mean to post this"

    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("oops, didn't mean to post this")
  end
  it "Won't update post without an image" do
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form")
  end
end 
