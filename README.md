Hair Salon
------------
Hair Salon allows the user to enter Stylists and their corresponding clients. One may view (list) all clients for each Stylist, update the stylist's name, or delete the stylist and her/his clients from the database.

REQUIREMENTS
------------
Ruby v 2.2.0
postgreSQL 9.4.0


INSTALLATION
------------
Run the following command to install pg:
`gem install pg`

Run the following command to start the postgreSQL server:
`postgres`

Run the following command in another terminal tab to access psql:
`psql`

Run the following commands in `psql` to create the databases:
1. `CREATE DATABASE hair_salon;`,
2. `\c hair_salon`,
3. `CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);`,
4. `CREATE TABLE clients (id serial PRIMARY KEY, description varchar, list_id int);`,
5. `CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;`

Run the following command to install bundler:
`gem install bundler`

Run the following command to install all required gems:
`bundle`

Run the following command to install rspec:
`gem install rspec`

Run the following command to run rspec:
`rspec`

KNOWN BUGS
---------
If you do not enter a name for stylist or client (either when creating or updating) and hit enter, a blank name slot will be entered into the displayed list.

AUTHOR
-------
Amy Michelle Johnson
amy.johnson.michelle@gmail.com


LICENSE
-------

Copyright (c) 2015 Amy Michelle Johnson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
