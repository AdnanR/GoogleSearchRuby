
class GoogleSearch

  def initialize
    @browser = $browser
    @browser.goto $baseurl
  end

  def query=(search_term)
    return @browser.text_field(:name=> "q").set search_term, :enter
  end

  def results
    # Find the search section by id, all of the search results are displayed in this div (see anchorPoint.png)
    # using this as an anchor point will filter non search result divs (if any)
    search_section = @browser.div :id=>"search"

    return nil unless search_section.exists?
    # Search results are present under div[class='g'] tag (see h3a.PNG)
    # Find dig.g under search_section
    #links = search_section.elements(:css=>"h3.r a")
    return search_section.elements(:css=>"div[class='g']")
  end
end
