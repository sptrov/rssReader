Ruby on Rails RSS reader(current steps)

Installation

1. bundle install
2. Rails db:setup db:migrate db:seed
3. bundle exec rake sync:feeds
3. rails s

Running tests

1. bundle exec rspec spec/

Info :
Since the sync might be a heavy operation it is done either by a rake or a Sync button on the entries page instead of calling it every single time opening the entries.
The rake task can lately be optimised to run in the background.