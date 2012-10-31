Testing Suite for Bill Lookup
=============================

Current Status:
---------------
__NOTE: commit messages containing a hash match the HEAD of the applicaiton repo__

#### Cucumber
All steps and scenarios passing!

	8 scenarios (8 passed)
	71 steps (71 passed)
	0m7.412s

#### RSpec

	Finished in 4.08 seconds
	86 examples, 0 failures

### Visual Aid
A screencast of the current functionality can be found [here](http://youtu.be/nWTp6x3YWQw) - 10/21/12

A running (on heroku) instance of the application (in the development environment) can be found [here](http://heroku.bryanchriswhite.com/search)

Functionality Avaliable
=======================

Searching & Search Filters
--------------------------

### Search By Automatic
Makes sure your search text is queries the appropriate field:
* 'Smith'					&rarr; Name 1
	- `Regex: /^\w+$/`
* 1234567					&rarr; Bill Number
	- `Regex: /^\d+$/`
* 012-NE0-11-222	&rarr; Map Number
	- `Regex: /^\w{3}-\w{3}-\w{2}-\w{3,}/`

Also varifies the correct number of bills should be returned

### Manage Search Filters
Allows for the (existance,) creation, editing and deletion of search filters.

**TODO:**
* Add filter management to the administrative interface
* Prevent the deletion of default filters
* Make it look pretty!

### Search By Selected Field
Guarantees the deafult filters are loaded, then makes sure the results of a given query match the expected results for the filters pattern

Viewables
---------
_Viewables_ are used to show or hide the pieces of data that are available for viewng (or not). 

### How They Work [ / will work]

Each viewable has an `allowed_as_header` and an `allowed_as_label` attribute; these will determine if and how (by default) the viewable will be displayed, along with it's respective bit of data.
For example, the `Name 1` viewable corresponds to the `name_1` field in a bill. If it's `allowed_as_label` is set to true but its `allowed_as_header` is set to false, then the `Name 1` label and the `name_1` of the current bill will be visible only on that bills 'show' page. `Name 1` won't show up as a header on the results table. If `allowed_as_header` is set to true but `allowed_as_label` is set to false then it will be visible in the results table (coming soon) but not on the 'show' page. If both are true then the viewable shows as a table header and on the bill 'show' page.

There will be a distinction between what viewables are _allowed permission_ to be visible for and what viewables are _configured_ to be visible for. There will defaults for both which can be changed by a user with the appropriate role. If a user is not logged in, these changes (called _preferences_) will persist as long as the session.

### Managing Viewables
Viewables manager is located [here](http://heroku.bryanchriswhite.com/viewables)

**TODO**
* Add viewables management to the administrative interface
* Viewables will be related to the weights table to allow for preferential ordering in the table head
* Prevent the deletion/creation of new viewables
	The available viewables are finite and will populate a listbox instead of being typed!!
* Distinguish between viewable permissions and preferences
* Allow users to set viewable preferences (based on user account or session if user is not logged in)
* Allow sorting based on viewables (in the results table)


Default Search Filters
======================
sorted by weight

1. **Name 1 or 2**

	Tooltip: Name 1 or 2 contains, matches whole words; names, suffixes, middle initials, LLC, etc.

	_Example: i.e. 'Jonas' matches 'Jonas Miles', 'Smith Jonas' or 'Smith Jonas Tyler'. Does NOT match 'Jon Ashton' or 'Jonaston'_

2. **Map Number**

	Tooltip: Map number equals; matches exactly

	_Examaple: i.e. ' 043-NW0-25-101' ONLY matches '043-NW0-25-101'_

3. **Bill Number**

	Tooltip: Bill number equals; matches exactly

	_Example: i.e. '1001001' ONLY matches '1001001'_

4. **Name 1**

	Tooltip: Name 1 begins with, LAST NAME FIRST (not intuitive); matches partial words

	_Example: i.e. 'Smith' matches 'Smith John' and 'Smithson Jane'. Does NOT match 'John Smith' or 'Howard Smith Comany LLC'_
