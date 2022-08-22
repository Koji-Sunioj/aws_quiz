a simple app to categorize and show / hide a shallow description of aws terms as scanned from digital cloud cheat sheets

1. clone, type "npm install" in both the server and client folders
2. install psql (if you haven't already), then:
	a. login as superuser to psql: sudo -u postgres psql
	b. create a user: create user my_user with password 'root';
	c. give create role to user: alter role  my_user createdb;
	d. logout from psql (\q or ctrl + d), log back in as new user: psql -d postgres -U my_user -h localhost
		* -h flag is needed when running on local machine
	e. create datatabase: create database aws_quiz
	f. logout again. load dump file from server folder to aws_quiz: psql -d aws_quiz -U my_user -f db.sql -h localhost
3. type "nodemon index.js" in server folder, then "npm start" in client folder

done!


