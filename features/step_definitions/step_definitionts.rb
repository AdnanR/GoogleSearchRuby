Given(/^I am on the Google home page$/) do
  #TestRun.browser.goto TestRun.baseurl
  #@browser.goto "http://www.google.com"
  @search_page = GoogleSearch.new
end

When(/^I enter ([^"]*) in the search box$/) do | search_term |
  @search_page.query = search_term
end

Then(/^the (\d+)(?:st|nd|rd|th) search result should contain the ([^"]*) text$/) do |result_number, search_term|
   index = result_number.to_i - 1
   results = @search_page.results

   # Verify search results were displayed
   expect(results).not_to be_nil, "No search results were displayed."

   # // Verify number of results is at least what we expect
   expect(results.length).to be >= result_number.to_i, "Results count is less then expected. Actual #{results.length}, Expected #{result_number} (at least)."

   # Verify that required result element contains search term.
   expect(results[index].text).to include(search_term), "Result #{result_number} doesnt contain #{search_term}"
end
