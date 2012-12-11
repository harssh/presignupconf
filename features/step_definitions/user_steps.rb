
def create_visitor
  @visitor ||= { :name => "Test", :email => "example@example.com",:password => "please", :password_confirmation => "please" }
end

def find_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
end


def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, name: @visitor[:name], email: @visitor[:email], password: @visitor[:password], password_confirmation: @visitor[:password_confirmation])
   @user.toggle!(:approved)
   
end

def delete_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
  @user.destroy unless @user.nil?
end


def sign_in
  visit signin_path
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
#%{I press "Sign in"}
  click_button "Sign in"
end

Given /^I do not exist as a user$/ do
  #pending # express the regexp above with the code you wish you had
create_visitor
delete_user

end

When /^I sign in with valid credentials$/ do
 # pending # express the regexp above with the code you wish you had
create_visitor
sign_in

end

Then /^I see an invalid login message$/ do
  
#  pending # express the regexp above with the code you wish you had
page.should have_content("Invalid email/password combination or account not activated")
end


Given /^I exist as a user$/ do
 # pending # express the regexp above with the code you wish you had
create_user
sign_in
end

Then /^I see a successful sign in message$/ do
  #pending # express the regexp above with the code you wish you had
page.should have_content("Sign out")
end

When /^I return to the site$/ do
  #pending # express the regexp above with the code you wish you had
visit root_path
end

Then /^I should be signed in$/ do
#  pending # express the regexp above with the code you wish you had
page.should have_content("Sign out")

end

When /^I sign in with a wrong email$/ do
#  pending # express the regexp above with the code you wish you had
@visitor = @visitor.merge(:email => "wrong@example.com")
sign_in
end

When /^I sign in with a wrong password$/ do
  #pending # express the regexp above with the code you wish you had
@visitor = @visitor.merge(:password => "wrong")
sign_in

end

Given /^I am logged in$/ do
  #pending # express the regexp above with the code you wish you had
create_user
sign_in
end

When /^I sign out$/ do
  #pending # express the regexp above with the code you wish you had
#visit signout_path
click_link('Sign out')
end

Then /^I should see a signed out message$/ do
  #pending # express the regexp above with the code you wish you had
page.should have_content("Signed out")
end

Then /^I should be signed out$/ do
  #pending # express the regexp above with the code you wish you had
page.should have_content("Sign in")
end

When /^I edit my account details$/ do
  #pending # express the regexp above with the code you wish you had
click_link "Settings"
fill_in "Name" ,:with => @visitor[:name]
fill_in "Email", :with => @visitor[:email]
fill_in "Password", :with => @visitor[:password]
fill_in "Confirm Password",:with => @visitor[:password_confirmation]
click_button "Save changes"
end

Then /^I should see an account edited message$/ do
  #pending # express the regexp above with the code you wish you had
page.should have_content('Profile updated')
end