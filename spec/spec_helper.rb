require 'rubygems'
require 'rspec'
require 'watir'


cap = Selenium::WebDriver::Remote::Capabilities.phantomjs("phantomjs.page.settings.userAgent" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1468.0 Safari/537.36")

$driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => cap

target_size = Selenium::WebDriver::Dimension.new(1280, 1024)

$driver.manage.window.size = target_size
