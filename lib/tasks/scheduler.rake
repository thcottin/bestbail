namespace :scheduler do
  task find_new_bails: :environment do
    Scraper::SeLoger.new.list_bail_urls.each do |url|
      bail = Bail.new(url: url)
      if bail.save
        ApplicationMailer.new_bail(bail).deliver_now!
      end
    end
  end
end
