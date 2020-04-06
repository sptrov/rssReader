# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Feed.create(name: "Cnn Europe", url: "http://rss.cnn.com/rss/edition_europe.rss", description: "Cnn new for Europe")
Feed.create(name: "BBC news", url: "http://feeds.bbci.co.uk/news/rss.xml", description: "BBC news")
