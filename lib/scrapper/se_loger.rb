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
      # fetch
      # byebug
      # p @document.css(BAIL_URL_SELECTOR)
      # @document.css(BAIL_URL_SELECTOR).map do |element|
      #   p element["href"]
      # end

      driver = Selenium::WebDriver.for :chrome
      driver.navigate.to "https://www.seloger.com/list.htm?types=1%2C9&projects=1&lift=1&furnished=0&price=NaN%2F1600&surface=45%2FNaN&rooms=2&places=%5B%7Bci%3A750108%7D%7C%7Bci%3A750109%7D%7C%7Bci%3A750110%7D%7C%7Bci%3A750111%7D%7C%7Bci%3A750102%7D%7C%7Bci%3A750103%7D%7C%7Bci%3A750104%7D%5D&qsVersion=1.0"

      driver.find_elements(class_name: ".c-pa-link").each do |element|
        p element["href"]
      end
      # element = driver.find_element(name: '')
      # element.send_keys "Hello WebDriver!"
      # element.submit

      element = driver.execute_script("return document.body")
      # puts driver.title
    end

    private

    def fetch
      response = Net::HTTP.get_response(@uri)
      @document = Nokogiri::HTML(response.body)
    end
  end
end
