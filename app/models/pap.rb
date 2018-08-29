class Pap < Scraper
  def ad_selector
    '.search-list-item .btn.btn-details'
  end

  def ad_title_selector
    '.item-title .h1'
  end
end
