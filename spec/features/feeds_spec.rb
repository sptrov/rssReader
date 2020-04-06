require 'rails_helper'

describe 'feeds', type: :feature do

  scenario 'create new feed sucessfully' do
    create_new_feed
  end

  scenario 'try create new feed but feed url is not valid' do
    visit feeds_path

    expect(page).to have_content('Feeds')

    click_link 'New Feed'
    expect(page).to have_content 'New Feed'

    fill_in 'Name', with: 'Best RSS'
    fill_in 'Url', with: 'wrong url'
    fill_in 'Description', with: 'Random Description'

    click_button 'Create Feed'
    expect(page).to have_content('You provided invalid URL')
  end

  scenario 'can not create a feed without a name' do
    visit new_feed_path
    fill_in 'Url', with: 'http://bestrss.com'
    fill_in 'Description', with: 'Random Description'

    click_button 'Create Feed'
    expect(page).to have_content("Name can't be blank")
   end

  scenario 'create two feeds and delete the second - first is still there' do
    create_new_feed
    create_new_feed("second feed","http://validUrl.com")
    within(page.all('tr')[2]) do
      accept_confirm do
        click_link 'Destroy'
      end
    end
     
    expect(page).to have_content('Feed was successfully destroyed')

    expect(page).to have_content('Best RSS')
  end



   scenario 'add feeds - sync them and check the entries ' do
    visit entries_path
    expect(page.all('tr').count).to eq(0)

    create_new_feed("Valid RSS CNN EU","http://rss.cnn.com/rss/edition_europe.rss")

    visit entries_path
    click_link 'Sync'
    sleep(5)
 
    expect(page.all('tr').count).to be > 1
   end


   def create_new_feed(name = "Best RSS",url = 'http://bestrss.com',description = "Random Description")
    visit feeds_path

    expect(page).to have_content('Feeds')
    click_link 'New Feed'
    expect(page).to have_content 'New Feed'

    fill_in 'Name', with: name
    fill_in 'Url', with: url
    fill_in 'Description', with: description

    click_button 'Create Feed'
    expect(page).to have_content('Feed was successfully created.')
    expect(page).to have_content(name)
   end
end
