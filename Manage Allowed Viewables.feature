@dev
Feature: Manage Allowed Viewables
	In order to clean up the results page and to limit which fields are viewable in the table and/or the individual bill page
	A system administrator
	Should be able to enable/disable each field for viewing on the table and individual bill page

	Background: Default viewables are allowed
		Given the default viewables
		And there is a bill whose "Bill Number" is "1000"
		When I visit the search page
		And I search for "1000"
		Then I should see the default viewables for the individual bill
