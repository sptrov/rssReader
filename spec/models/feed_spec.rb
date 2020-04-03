require 'rails_helper'

describe Feed, type: :model do
  let(:feed) { Feed.new }
  let(:initialized_feed) { Feed.create(name:"test feed cnn",
                                       url:"http://rss.cnn.com/rss/edition_world.rss",
                                       description:"This is a test cnn rss feed") }


  it "is not valid without attributes" do
    expect(feed).to_not be_valid
  end

  it "is in db - it should be valid" do
    expect(initialized_feed).to be_valid
  end

  it "receives a feed name but still not valid" do
    feed.name = initialized_feed.name
    expect(feed).to_not be_valid
  end

  it "receives a feed url that is with a wrong format" do
    feed.name = initialized_feed.name
    feed.url = "random text not url"

    expect(feed).to_not be_valid
  end

  it "having a name and valid url makes the feed valid" do
    feed.name = initialized_feed.name
    feed.url = initialized_feed.url

    expect(feed).to be_valid
  end

  it "expect the feed to have entry association" do
    fe1 = fe2 = FeedEntry.new
    expect(feed.feed_entries).to_not be_present
    feed.feed_entries = [fe1,fe2]
    expect(feed.feed_entries).to be_present

  end

end