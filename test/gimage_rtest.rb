require 'rubygems'
require 'rspec'
require 'watir-webdriver'


cap = Selenium::WebDriver::Remote::Capabilities.phantomjs("phantomjs.page.settings.userAgent" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1468.0 Safari/537.36")
driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => cap
target_size = Selenium::WebDriver::Dimension.new(1280, 1024)
driver.manage.window.size = target_size

describe "images.google.com" do
  let(:b) {@b ||= Watir::Browser.new driver }
  before { b.goto "images.google.com" }
  after {
    sleep 2
  }

  it "should have a title" do
    expect(b.title) == "Google Images"
  end

  it "should have images" do
    b.screenshot.save 'img.png'
    input = b.text_field(:id=>'lst-ib')
    input.set('robots')
    input.send_keys(:enter)

    b.div(:id=>'rg_s').wait_until_present

    results = b.div(:id=>'rg_s').divs

    expect(b.title).to include('robots')
    expect(results.length).to be > 0
  end 

end
