class Feed < ApplicationRecord
  has_many :feed_entries, dependent: :destroy
  
  #for a feed to be valid lets say at minimum we should have some name and something that looks like url
  validates :name, presence: true
  validates :url, format: { with: URI.regexp, message: 'You provided invalid URL' }
end
