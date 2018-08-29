namespace :scheduler do
  task find_new_bails: :environment do
    SeLoger.new(ENV['SELOGER_URL']).get_new_bails.each do |result|
      bail = Bail.new(url: result[:url], title: result[:title])
      if bail.save
        p "New bail on Seloger.com: #{bail.title} - #{bail.url}"
        ApplicationMailer.new_bail(bail).deliver_now!
      end
    end

    Pap.new(ENV['PAP_URL']).get_new_bails.each do |result|
      bail = Bail.new(url: result[:url], title: result[:title])
      if bail.save
        p "New bail on Seloger.com: #{bail.title} - #{bail.url}"
        ApplicationMailer.new_bail(bail).deliver_now!
      end
    end
  end
end
