module FeedsHelper
  def self.sync
    Feed.all.each do |feed|
        rss = HTTParty.get(feed.url).body
        feed_results = Feedjira.parse(rss)
        feed_results.entries.each do |entry|
          feed_entry = feed.feed_entries.where(title: entry.title).first_or_initialize

          feed_entry.update_attributes(
                        content: entry.content, author: entry.author, url: entry.url, 
                        published: entry.published, summary: entry.summary, image: entry.image)
          p "Synced Entry - #{entry.title}"
        end
        p "Synced Feed - #{feed.name}"
    end
  end
end
