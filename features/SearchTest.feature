Feature: SearchTest

@sample
Scenario Outline: Verify given term is displayed in search results
	Given I am on the Google home page
	When I enter <search term> in the search box
	Then the 1st search result should contain the <search term> text
	Examples:
	| search term    |
	| Facebook       |
	| Google         |
	| Microsoft      |
	| asdaldhjkashdk |
