require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Full_check" do

  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = "https://www.google.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    expect(@verification_errors).to eq([])
  end

  it "server_ok" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "number").click
    @driver.find_element(:id, "number").clear
    @driver.find_element(:id, "number").send_keys "15"
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, "//h1").text).to eq "Ответ сервера"
    expect(@driver.find_element(:xpath, "//tbody/tr/th[2]").text).to eq "17"
    expect(@driver.find_element(:xpath, "//tbody/tr/th[3]").text).to eq "19"
  end

  it "server_fail" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "number").click
    @driver.find_element(:id, "number").clear
    @driver.find_element(:id, "number").send_keys "asd"
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, "//h1").text).to eq "Ответ сервера"
    expect(@driver.find_element(:xpath, "//p").text).to eq "Please, input valid number"
  end

  it "browser_ok" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "number").click
    @driver.find_element(:id, "number").clear
    @driver.find_element(:id, "number").send_keys "15"
    @driver.find_element(:id, "client-side-xslt").click
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, "//h1").text).to eq "Результат обработки браузером"
    expect(@driver.find_element(:xpath, "//tbody/tr/th[2]").text).to eq "17"
    expect(@driver.find_element(:xpath, "//tbody/tr/th[3]").text).to eq "19"
  end

  it "browser_fail" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "number").click
    @driver.find_element(:id, "number").clear
    @driver.find_element(:id, "number").send_keys "sdffe"
    @driver.find_element(:id, "client-side-xslt").click
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, "//h1").text).to eq "Результат обработки браузером"
    expect(@driver.find_element(:xpath, "//p").text).to eq "Please, input valid number"
  end

  it "xml_ok" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "number").click
    @driver.find_element(:id, "number").clear
    @driver.find_element(:id, "number").send_keys "15"
    @driver.find_element(:id, "client-side").click
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:css, '#folder1 .line:nth-child(2) > span:nth-child(2)').text).to eq "17"
    expect(@driver.find_element(:css, '#folder1 .line:nth-child(4) > span:nth-child(2)').text).to eq "19"
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end