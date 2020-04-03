require 'rails_helper'
describe FeedsController do
  describe "GET index" do
    it "checks for success status" do
      get :index
      expect(response).to be_successful
    end

    it "loads the feeds" do
      feed = Feed.create(name: "Test", url: "http://test.com", description: "test")

      get :index
      expect(assigns(:feeds)).to eq [feed]
    end
  end

  describe "GET feed_entries" do
    it "loads the feeds" do
      feed = Feed.create(name: "Test", url: "http://test.rss", description: "test")

      feed.feed_entries.create(title: "test title", published: Time.now.utc, content: "test-content",
        url: "http://test.com", author: "author")

      get :feed_entries

      expect(response).to be_successful
      expect(assigns(:entries).length).to eq 1
      expect(assigns(:entries)).to eq feed.feed_entries
    end
  end

  describe "GET sync" do
    it "loads the feeds" do
      feed = Feed.create(name: "Test", url: "http://rss.cnn.com/rss/edition_europe.rss", description: "test")

      get :sync

      expect(response).to redirect_to '/entries'
    end
  end

  describe "GET new" do
    it "checks for success status" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST create" do
    it "creates a new record" do
      params = { feed: { name: "Test", url: "https://test.com", description: "test" } }
      post :create, params: params

      expect(Feed.count).to eq 1
    end
  end

  describe "delete Destroy" do
    it "deletes an existing record" do
      entry = Feed.create(name: "Test", url: "https://test.com", description: "test")
      params = { id: entry.id }
      delete :destroy, params: params

      expect(Feed.count).to eq 0
    end
  end
end