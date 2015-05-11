## Welcome to Support Hero App

### Setup

* Using ruby 2.1.4p265

* Database creation
```
    rake db:migrate
    rake db:seed
```

* Running tests
```
    rake db:test:prepare
    rake spec
```

* Start rails server
```
    rails server
```

### Features
**Displaying Today's Support Hero**
*/support_assignments/today* – Displays the user who is assigned to be Support Hero today

**Displaying a single user’s schedule**
*/users* – this can be used to discover all users
*/users/{user_id}/support_assignments* – once a user's id is known, use it to display all the dates that user is assigned to Support Hero

**Display the full schedule for all users in the current month**
*/support_assignments/month/:month_number* – lists all the assignments for a given month. month_number ranges from 1(January) to 12(December)

**Users should be able to mark one of their days on duty as unavailable**
*/users* – starting with the /users URL, click “Edit” to mark a date unavailable.<br>
When user has marked a date as unavailable, that user's Support Hero duty assignment is swapped with a user who is available on that date.
Future attempts to assign a user to an unavailable date will result in error.

**Users should be able to swap duty with another user’s specific day**
*users/:user_id/support_assignments/:id/edit* – when a :user_id is known, simply edit the support_assignment by changing the user name. Then locate the second user and edit one of his/her assignments in the similar fashion.


### API specifications

Resource           |          Methods     |                URI                            | Description
-------------------|----------------------|-----------------------------------------------|----------------------------------
User               | GET                  | /users/{id}                                   | <ul><li>Contains information about a User</li><li>{id} is Optional</li><li>.json to get JSON representation</li></ul>
                   | PUT, PATCH, DELETE   | /users/{id}.json                              | <ul><li>Modify User information</li><li>Header: Content-Type: application/json<br>Parameters: name, unavailable_date<br>Example: {"user":{"name":"User Name", "unavailable_date":"01-01-2015"}}</li></ul>
                   | POST                 | /users.json                                   | <ul><li>Create new User</li><li>Parameters: name, unavailable_date</li><li>Format: JSON</li><li>Example: {"user":{"name":"User Name", "unavailable_date":"01-01-2015"}}</ul>
Support Assignments| GET                  | /users/{user_id}/support_assignments/{id}     | <ul><li>Contains Support Assignment information for a User</li><li>{user_id} is Required<br>{id} is Optional</li><li>.json to get json representation</li></ul>
                   | GET                  | /support_assignments/today.json<br>/support_assignments/month/{month}.json | <ul><li>Lists all Support Assignments for today and for a specified month number</li><li>.json to get json representation</li></ul>
                   | PUT, PATCH, DELETE   | /users/{user_id}/support_assignments/{id}.json| <ul><li>Support Assignments</li><li>Header: Content-Type: application/json<br>Parameters: date.<br>Example: {"support_assignment":{"date":"22-05-2015"}}</li></ul>
                   | POST                 | /support_assignments.json                     | <ul><li>Create new Support Assignment</li><li>Header: Content-Type: application/json<br>Parameters: user_id, date.<br>Example:{"support_assignment":{"user_id":1, "date":"19-06-2015"}}</li></ul>



