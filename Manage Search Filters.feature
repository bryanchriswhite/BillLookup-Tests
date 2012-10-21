Feature: Manage search filters
	In order to control which fields a user can search against
	A system administrator
	Should be able to enable/disable the default filters as well as create, edit and delete new ones

	Background: Generate filters
		Given the default search filters
		When I visit the search page
		Then I should see all filters

	Scenario: Disable a search filter
		Given the filter "Name 1" is "enabled"
		When I "disable" the filter "Name 1"
		And I visit the search page
		Then I should not see the filter "Name 1"
		And I should not be able to search against filter "Name 1"

	Scenario: Enable a search filter
		Given the filter "Name 1 or 2" is "disabled"
		When I "enable" the filter "Name 1 or 2"
		And I visit the search page
		Then I should see filter "Name 1 or 2"
		And I should be able to search against filter "Name 1 or 2"

	@javascript
	Scenario: Selecting and mousing over filters
		Given I am on the results page
		When I mouse over filter "Name 1 or 2"
		Then I should see the "Name 1 or 2" tooltip
		And I should see the "Name 1 or 2" example
