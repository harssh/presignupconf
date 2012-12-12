def new_user
  @user ||= { :name =>"example", :email => "example@example.com",:password => "example", :password_confirmation => "example" }
end

def account_request user
  visit signup_path
  fill_in "Name", :with => user[:name]
  fill_in "Email", :with => user[:email]
  fill_in "Password", :with => user[:password]
  fill_in "Confirmation", :with => user[:password_confirmation]
 # click_button "Sign Up"
%{I press "Sign up"}
end

Given /^I am not logged in$/ do
  visit root_path
end

When /^I visit home page$/ do
 # pending # express the regexp above with the code you wish you had

 visit root_path
 
end

Then /^I should see a "(.*?)" link$/ do |arg1|
 # pending # express the regexp above with the code you wish you had


page.should have_content(arg1)

end

When /^I click a button "(.*?)"$/ do |arg1|
 # pending # express the regexp above with the code you wish you had
click_link(arg1)

end

Then /^I should see a form with a field "(.*?)"$/ do |arg1|
  #pending # express the regexp above with the code you wish you had

page.should have_content(arg1)

end

When /^I request an account with valid user data$/ do
  #pending # express the regexp above with the code you wish you had
  account_request new_user
end


Then /^I should see a message "(.*?)"$/ do |arg1|
  #pending # express the regexp above with the code you wish you had
visit thankyou_path
page.should have_content(arg1)

end

