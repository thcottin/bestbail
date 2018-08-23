namespace :scheduler do
  task :print_elements do
    Scrapper::SeLoger.new.bails
  end
end
