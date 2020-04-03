Ruby on Rails RSS reader(current steps)

Installation

1. bundle install
2. Rails db:setup db:migrate
3. bundle exec rake sync:feeds
3. rails s

Running tests

1. bundle exec rspec spec/