namespace :scheduler do
  task :print_elements => :environment do
    Scrapper::SeLoger.new.bails
  end
end
