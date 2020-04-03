namespace :sync do
  task feeds: [:environment] do
      FeedsHelper::sync
  end
end