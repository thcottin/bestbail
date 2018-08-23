require 'net/http'
require 'selenium-webdriver'

module Scrapper
  class SeLoger
    # "https://www.seloger.com/list.htm?types=1%2C9&projects=1&lift=1&furnished=0&price=NaN%2F1600&surface=45%2FNaN&rooms=2&places=%5B%7Bci%3A750108%7D%7C%7Bci%3A750109%7D%7C%7Bci%3A750110%7D%7C%7Bci%3A750111%7D%7C%7Bci%3A750102%7D%7C%7Bci%3A750103%7D%7C%7Bci%3A750104%7D%5D&qsVersion=1.0"
    BAIL_URL_REGEX = /https:\/\/([\w,\.,\/,-]+)/
    BAIL_URL_SELECTOR = '.c-pa-link'

    def initialize()
      # @uri = URI.parse(url)
    end

    # Returns the bails on page 1
    def bails
      chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil)

      chrome_opts = chrome_bin ? { "chromeOptions" => { "binary" => chrome_bin } } : {}

      Capybara.register_driver :chrome do |app|
        Capybara::Selenium::Driver.new(
           app,
           browser: :chrome,
           desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(chrome_opts)
        )
      end

      Capybara.default_driver = :chrome
      browser = Capybara::Session.new(:chrome)
      browser.visit "https://www.seloger.com/list.htm?types=1%2C9&projects=1&lift=1&furnished=0&price=NaN%2F1600&surface=45%2FNaN&rooms=2&places=%5B%7Bci%3A750108%7D%7C%7Bci%3A750109%7D%7C%7Bci%3A750110%7D%7C%7Bci%3A750111%7D%7C%7Bci%3A750102%7D%7C%7Bci%3A750103%7D%7C%7Bci%3A750104%7D%5D&qsVersion=1.0"
      links = browser.all BAIL_URL_SELECTOR
      links.each do |link|
        p link["href"]
      end
    end

    private

    def fetch
      response = Net::HTTP.get_response(@uri)
      @document = Nokogiri::HTML(response.body)
    end
  end
end
