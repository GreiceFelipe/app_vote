# APP VOTE

This app has the proposal to create campaigns for voting. Each campaign can be created several options for votes.

This app use:

* Rails version 5.2.4
* Ruby version 2.5.7
* Mysql 
* Rspec - To test the models
* Factory bot rails, faker and shoulda matchers - to help write tests 
* Rails admin version 2.0


To install this app just follow the normal processes of installing an app ruby on rails

* First clone this project
* Make sure your current ruby version is correct
* In the project folder:
    ```
    bundle install 
    ```
* Make sure your database is correctly configured in the `database.yml` file
* To run the project: 
    ```
    rails db:create
    rails db:migrate
    rails s
    ```
 * To run the test 
    ```
    rspec 
    ```
    
 Improvements that could be implemented:
 
 * Rails admin could have improvements at creating and editing campaigns
 * Results graphs could be better
 * Among other improvements
