require 'rubygems'
require 'selenium-webdriver'

chromedriver_path = File.join(File.absolute_path('/', File.dirname(__FILE__)),"","chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path

driver = Selenium::WebDriver.for :chrome
driver.get "http://google.com"

element = driver.find_element :name => "q"
element.send_keys "Lamhot JM Siagian"
element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "lamhot jm siagian" }

puts "Page title is #{driver.title}"
driver.quit