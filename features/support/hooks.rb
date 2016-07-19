require 'watir-webdriver'
require 'pry'
require 'require_all'
require 'rspec'

browser = Watir::Browser.new :chrome

browser.driver.manage.timeouts.implicit_wait = 15
browser.driver.manage.window.maximize

Before do
  $baseurl = ENV["BASEURL"]
  $browser = browser
end

After do |scenario|
end

at_exit do
  browser.quit
end
