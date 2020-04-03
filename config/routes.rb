Rails.application.routes.draw do
  resources :feeds
  root :to => 'feeds#feed_entries'
  get '/entries', to: 'feeds#feed_entries'
  get '/sync', to: 'feeds#sync'

end
