require 'rspec'
require 'selenium-webdriver'

describe  'Duck Search' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end
  it "should find duck " do
    @driver.navigate.to 'http://localhost/litecart'

    element = @driver.find_element(:name, 'query')
    element.send_keys 'duck'
    element.submit
    #@driver.find_element(:name, 'btnG').click
    @wait.until {@driver.title == 'Search Results for "duck" | My Store'}
  end

  after(:each ) do
    @driver.quit
  end
end