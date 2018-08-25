require 'net/http'
require 'selenium-webdriver'

module Scraper
  class SeLoger
    BAIL_URL_REGEX = /(https:\/\/[\w,\.,\/,-]+)/
    BAIL_URL_SELECTOR = '.c-pa-link'

    def initialize()
      @url = "https://www.seloger.com/list.htm?types=1&projects=1&sort=d_dt_crea&price=NaN%2F1600&surface=45%2FNaN&rooms=2%2C3&places=%5B%7Bci%3A750102%7D%7C%7Bci%3A750103%7D%7C%7Bci%3A750104%7D%7C%7Bci%3A750109%7D%7C%7Bci%3A750110%7D%7C%7Bci%3A750111%7D%5D&qsVersion=1.0"
    end

    # Returns the bails on page 1
    def list_bail_urls
      browser = Capybara::Session.new(:chrome)
      browser.visit @url
      links = browser.all BAIL_URL_SELECTOR

      @results = links.map do |link|
        link["href"] =~ BAIL_URL_REGEX
        $1
      end

      @results
    end
  end
end
