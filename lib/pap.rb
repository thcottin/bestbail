class Pap < Scraper
  def ad_selector
    '.search-list-item > a:nth-child(2)'
  end
end
