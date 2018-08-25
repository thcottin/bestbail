require 'net/http'
require 'selenium-webdriver'

class Scraper
  URL_REGEX = /(https:\/\/[\w,\.,\/,-]+)/

  def initialize(url)
    @url = url
  end

  # Returns the bails on page 1
  def list_bail_urls
    browser = Capybara::Session.new(:chrome)
    browser.visit @url
    links = browser.all ad_selector

    @results = links.map do |link|
      link["href"] =~ URL_REGEX
      $1
    end

    @results
  end

  private

    def ad_selector
      raise "Can't be used here"
    end
end
