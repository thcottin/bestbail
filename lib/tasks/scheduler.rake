namespace :scheduler do
  task find_new_bails: :environment do
    SeLoger.new(ENV['SELOGER_URL']).list_bail_urls.each do |url|
      bail = Bail.new(url: url)
      if bail.save
        p "New bail on Seloger.com: #{bail.url}"
        ApplicationMailer.new_bail(bail).deliver_now!
      end
    end

    Leboncoin.new(ENV['LEBONCOIN_URL']).list_bail_urls.each do |url|
      bail = Bail.new(url: url)
      if bail.save
        p "New bail on Leboncoin.fr: #{bail.url}"
        # ApplicationMailer.new_bail(bail).deliver_now!
      end
    end

    Pap.new(ENV['PAP_URL']).list_bail_urls.each do |url|
      bail = Bail.new(url: url)
      if bail.save
        p "New bail on Leboncoin.fr: #{bail.url}"
        # ApplicationMailer.new_bail(bail).deliver_now!
      end
    end
  end
end
