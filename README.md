* Using ruby 2.1.4p265

1. Database creation
```
    rake db:migrate
    rake db:seed
```

2. Running tests
```
    rake db:test:prepare
    rake spec
```

3. Start rails server
```
    rails server
```

4. Features
**Displaying Today's Support Hero**
/support_assignments/today – Displays the user who is assigned to be Support Hero today

**Displaying a single user’s schedule**
/users – this can be used to discover all users
/users/{user_id}/support_assignments – once a user's id is known, use it to display all the dates that user is assigned to Support Hero

**Display the full schedule for all users in the current month**
/support_assignments/month/:month_number – lists all the assignments for a given month. month_number ranges from 1(January) to 12(December)

**Users should be able to mark one of their days on duty as unavailable**
/users – starting with the /users URL, click “Edit” to mark a date unavailable
When user has marked a date as unavailable, that user's Support Hero duty assignment is swapped with a user who is available on that date. (WHAT IF NO USER IS AVAILABLE)
Future attempts to assign a user to an unavailable date will result in error.

**Users should be able to swap duty with another user’s specific day**
users/:user_id/support_assignments/:support_assignment_id/edit – given a :user_id
/users – starting with this url, click “Edit” to mark a date unavailable

4. API specifications

Resource           |          Methods     |                URI                       | Description
-------------------|----------------------|------------------------------------------|----------------------------------
User               | GET                  | /users/{id}                              | <ul><li>Contains information about a User</li><li>{id} is Optional</li><li>.json to get json representation</li></ul>
                   | PUT, PATCH, DELETE   | /users/{id}                              | <ul><li>Modify User information</li><li>Parameters: name, unavailable_date</li><li>Format: JSON</li></ul>
                   | POST                 | /users                                   | <ul><li>Create new User</li><li>Parameters: name, unavailable_date</li><li>Format: JSON</li></ul>
Support Assignments| GET                  | /support_assignments/{id}                | <ul><li>Contains information about a Support Assignments</li><li>{id} is Optional</li><li>.json to get json representation</li></ul>
                   | GET                  | /users/{user_id}/support_assignments     | <ul><li>Lists all Support Assignments for a User</li><li>{user_id} is Requred</li><li>.json to get json representation</li></ul>
                   | GET                  | /support_assignments/today<br>/support_assignments/month/{month} | <ul><li>Lists all Support Assignments for today and for a specified month number</li><li>.json to get json representation</li></ul>
                   | PUT, PATCH, DELETE   | /users/{user_id}/support_assignments/{id}| <ul><li>Support Assignments</li><li>Parameters: date</li><li>Format: JSON</li></ul>
                   | POST                 | /support_assignments                     | <ul><li>Create new Support Assignment</li><li>Parameters: user_id, date</li><li>Format: JSON</li></ul>



