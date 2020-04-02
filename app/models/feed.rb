class Feed < ApplicationRecord
  has_many :feed_entries, dependent: :destroy

  validates :url, format: { with: URI.regexp, message: 'You provided invalid URL' }
end
