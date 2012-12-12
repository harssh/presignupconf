Feature: View Progress

As the owner of the site

I want to know how many visitors have requested accounts

so I can know account requests



Scenario: Administrator views list of users

Given I request an account with valid user data

And I am logged in as an administrator

When I visit the users page

Then I should see a list of users


