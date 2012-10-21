Feature: Search by selected field
	In order to search for bills with finer granularity
	The users
	Should be able to select which field they want to search against

	Background:
		Given these bills:
			| bill_number | name_1         | name_2               | map_number     |
			| 1           | hall jason     | jason & margret      | 053-NE0-25-105 |
			| 2           | marshall sam   | marshall samuel      | 013-NW0-25-101 |
			| 3           | thallow edward | some hall company    | 023-SW0-85-441 |
			| 4           | marsh stan     | some company LLC     | 223-SE0-84-131 |
			| 5           | marsh kyle     | some company, LLC    | 043-NW0-25-543 |
			| 6           | tyler hall     |                      | 843-NE6-53-101 |
			| 7           | smith marshall |                      | 048-NW3-26-101 |
		And the default search filters
		When I visit the search page
		Then I should see all filters

	Scenario: Search using a filter whose pattern matches multiple field
		Given the filter "Name 1 or 2" is "enabled"
		And the filter "Name 1 or 2" is selected
		When I search for "hall"
		Then I should see a list of bills whose "Name 1" or "Name 2" field contains "hall"
		And that list should contain 3 bills

	Scenario: Search using a filter whose pattern matches a single field
		Given the filter "Name 1" is "enabled"
		And the filter "Name 1" is selected
		When I search for "hall"
		Then I should see the bill whose "Name 1" is "hall jason"
