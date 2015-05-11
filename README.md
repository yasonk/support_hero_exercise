* Using ruby 2.1.4p265

1. Database creation
```
    rake db:migrate
    rake db:seed```

2. Running tests
    *rake db:test:prepare
    *rake spec

3. Start rails server
    rails server

* Deployment instructions


* API specifications

Resource           |          Methods     |                URI                  | Description
-------------------|----------------------|-------------------------------------|----------------------------------
User               | GET                  | /users/{id}                         | <ul><li>Contains information about a User</li><li>{id} is Optional</li><li>.json to get json represenation</li></ul>
                   | PUT, PATCH, DELETE   | /users/{id}                         | <ul><li>Modify User information</li><li>Parameters: name, unavailable_date</li><li>Format: JSON</li></ul>
                   | POST                 | /users                              | <ul><li>Create new User</li><li>Parameters: name, unavailable_date</li><li>Format: JSON</li></ul>
Support Assignments| GET                  | /support_assignments/{id}           |
                   | GET                  | /users/:user_id/support_assignments |