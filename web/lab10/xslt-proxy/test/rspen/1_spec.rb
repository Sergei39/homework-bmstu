# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
describe '1' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it '1' do
    @driver.get('http://127.0.0.1:3001/')
    @driver.manage.resize_to(960, 789)
    @driver.find_element(:id, 'number').click
    @driver.find_element(:id, 'number').send_keys('10')
    @driver.find_element(:id, 'client-side').click
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:css, '#folder1 .line:nth-child(2) > span:nth-child(2)').click
    @driver.find_element(:css, '#folder1 .line:nth-child(4) > span:nth-child(2)').click
    @driver.find_element(:css, '.form-check:nth-child(4) > .form-check-label').click
    @driver.find_element(:css, '.form-check:nth-child(3) > .form-check-label').click
    @driver.find_element(:id, 'number').click
    @driver.find_element(:id, 'number').send_keys('jkh')
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:css, '.line:nth-child(4) > span:nth-child(2)').click
  end
end
