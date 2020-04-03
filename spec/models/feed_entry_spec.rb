require 'rails_helper'

describe Feed, type: :model do
  let(:feed_entry) { FeedEntry.new }
  let(:initialized_feed) { Feed.create(name:"test feed cnn",
                                       url:"http://rss.cnn.com/rss/edition_world.rss",
                                       description:"This is a test cnn rss feed") }

  let(:initialized_feed_entry) { FeedEntry.create(title:"test feed entry",
                                       url:"https://www.bbc.co.uk/news/uk-51950920",
                                       published: Time.now,
                                       summary: "With soup kitchens closing and hostels 'like a Petri dish', homeless people are scared about the future.",
                                       feed: initialized_feed
                                       ) }


  it "is not valid without attributes" do
    expect(feed_entry).to_not be_valid
  end

  it "is in db - it should be valid" do
    expect(initialized_feed_entry).to be_valid
  end

  it "receives a feed_entry title but still not valid" do
    feed_entry.title = initialized_feed_entry.title
    expect(feed_entry).to_not be_valid
  end

  it "receives a feed_entry url that is with a wrong format" do
    feed_entry.title = initialized_feed_entry.title
    feed_entry.url = "random text not url"
    feed_entry.feed = initialized_feed

    expect(feed_entry).to_not be_valid
  end

  it "having a name and valid url makes the feed valid" do

    feed_entry.title = initialized_feed_entry.title
    feed_entry.url = initialized_feed_entry.url
    feed_entry.feed = initialized_feed

    expect(feed_entry).to be_valid
  end
end