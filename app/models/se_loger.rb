class SeLoger < Scraper
  def ad_selector
    '.c-pa-link'
  end

  def ad_title_selector
    '.detail-title'
  end
end
