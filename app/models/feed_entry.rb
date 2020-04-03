class FeedEntry < ApplicationRecord
    belongs_to :feed
    #validation is missing since some of the rss feeds are not very consistent in presenting similar data
    #some of them dont have published date,image or author so the only think we can validate here is url and title
    validates :title, presence: true
    validates :url, format: { with: URI.regexp, message: 'You provided invalid URL' }
    scope :newest, -> { order(published: :desc) }
end
