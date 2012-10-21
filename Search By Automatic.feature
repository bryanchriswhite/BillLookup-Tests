Feature: Search By Automatic
	In order to quickly find an individual bill by map number or by bill number whose respective fields match the search text, or to see a listing of bills whose Name 1 field begins with the search text
	The users
	Should by default have automatic filtering selected when they first navigate to the search page

	Background: Navigating to the search page for the first time
		Given I am a new user
		And these bills:
			| bill_number | map_number        | name_1      |
			| 1           | 043-NW0-25-101    | smith john  |
			| 2           | 027-SE0-12-013    | smith joel  |
			| 3           | 027-SE0-12-013A   | peters adam |
			| 4           | 027-SE0-12-013AA  | marsh stan  |
			| 5           | 027-SE0-12-013AA1 | marsh kyle  |
		When I visit the search page
		Then the filter "automatic" should be selected

	Scenario: Searching for map number
		Given there is no bill whose "Map Number" is "043-NW0-25-101A"
		When I search for "043-NW0-25-101" 
		Then I should see the bill whose "id" is "01"


	Scenario: Searching for bill number
		When I search for "5"
		Then I should see the bill whose "Map Number" is "027-SE0-12-013AA1"


	Scenario: Searching for name 1
		When I search for "sm"
		Then I should see a list of bills whose "Name 1" begins with "sm"
		And that list should contain 2 bills
		And that list should not contain any bills whose "name_1" field don't begin with "sm"
