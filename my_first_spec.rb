require 'rspec'
require 'selenium-webdriver'

describe  'Google search' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end
  it "should find webdriver " do
    @driver.navigate.to 'http://google.com'

    element = @driver.find_element(:name, 'q')
    element.send_keys 'webdriver'
    @driver.find_element(:name, 'btnG').click
    @wait.until {@driver.title == 'webdriver - Google Search'}
  end

  after(:each ) do
    @driver.quit
  end
end