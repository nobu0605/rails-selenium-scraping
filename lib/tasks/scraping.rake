require 'selenium-webdriver'

namespace :scraping do
  desc "Scrape example"
  task example: :environment do
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')

    driver = Selenium::WebDriver.for(:remote, url: 'http://selenium:4444/wd/hub', capabilities: options)
    driver.navigate.to "https://example.com"

    puts "Page Title: #{driver.page_source}"
    driver.quit
  end
end
