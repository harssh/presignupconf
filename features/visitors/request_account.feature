Feature: Request Account

  As a visitor to the website
  I want to request an account
  so I can be notified when the account is created

  Background:
    Given I am not logged in
    
Scenario: User views home page

When I visit home page
Then I should see a "Sign up" link


Scenario: User view account request form

When I visit home page
And I click a button "Sign up"
Then I should see a form with a field "Email"

Scenario: User signs up with valid data 

When I request an account with valid user data
Then I should see a message "Thank You"




