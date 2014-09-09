#!/usr/bin/env ruby

require 'watir-webdriver'

browser = Watir::Browser.new :firefox
browser.goto 'http://www.google.com'

# Enter the ID of the Google search box between the quotes.
# 
# In an open browser, go to Google and right-click on the
# search box, then click 'Inspect Element' to find the ID.
search_field = browser.text_field(:id => "")
search_field.wait_until_present

# Set the search_field to your search query.
search_field.set ""

sleep 30
browser.quit
