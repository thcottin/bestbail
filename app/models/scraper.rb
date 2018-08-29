require 'net/http'
require 'selenium-webdriver'

class Scraper
  URL_REGEX = /(https:\/\/[\w,\.,\/,-]+)/

  def initialize(url)
    @url = url
    @results = []
    @bails = []
  end

  # Returns the bails on page 1
  def get_new_bails
    page = Capybara::Session.new(:chrome)
    page.visit @url
    ad_urls = page.all(ad_selector).map do |link|
      link["href"] =~ URL_REGEX
      $1
    end

    ad_urls.reject! { |url| Bail.exists?(url: url) }

    ad_urls.each do |ad_url|
      page.visit ad_url
      ad_title = page.find(ad_title_selector).text
      @results << { url: ad_url, title: ad_title }
    end

    @results
  end

  private

    def ad_selector
      raise "Can't be used here"
    end

    def ad_title_select
      raise "Can't be used here"
    end
end
