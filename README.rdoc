* Using ruby 2.1.4p265

1. Database creation
    rake db:migrate
    rake db:seed

2. Running tests
    rake db:test:prepare
    rake spec

3. Start rails server
    rails server

* Deployment instructions


* API specifications

Resource |                    Methods    |           URI              | Description
---------|-------------------------------|----------------------------|----------------------------------
User     | GET, POST, PUT, PATCH, DELETE |http://host/users/{user_id} | Contains information about a User


<table>
    <th>Resource</th><th>Methods</th><th>URI</th><th>Description</th>
    <tr>
        <td>User</td><td>GET, POST, PUT, PATCH, DELETE</td><td>http://host/users/{user_id}</td><td>Contains information about a User</td>
    </tr>
</table>
