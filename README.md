Testing Suite for Bill Lookup
=============================

Current Status:
---------------
__NOTE: commit messages containing a hash match the HEAD of the applicaiton repo__

All steps and scenarios passing!

	8 scenarios (8 passed)
	61 steps (61 passed)
	0m12.631s

### Visual Aid
A screencast of the current functionality can be found [here](http://youtu.be/nWTp6x3YWQw) 

A running (on heroku) instance of the application (in the development environment) can be found [here](http://heroku.bryanchriswhite.com/search)

Functionality Avaliable
-----------------------

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
* Require authentication to view the filter manager page
* Prevent the deletion of default filters
* Make it look pretty!

### Search By Selected Field
Guarantees the deafult filters are loaded, then makes sure the results of a given query match the expected results for the filters pattern


Default Filters
===============
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
