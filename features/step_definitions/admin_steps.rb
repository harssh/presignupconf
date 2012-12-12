def create_visitor
  @visitor ||= { :name => "Test", :email => "example@example.com",:password => "please", :password_confirmation => "please" }
end

def find_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
end



def create_admin
  create_visitor
# delete_user
  @user = FactoryGirl.create(:user, name: @visitor[:name], email: @visitor[:email], password: @visitor[:password], password_confirmation: @visitor[:password_confirmation])
   @user.toggle!(:admin)
   @user.toggle!(:approved)
   
end

def sign_in
  visit signin_path
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
#%{I press "Sign in"}
  click_button "Sign in"
end

Given /^I am logged in as an administrator$/ do
  #pending # express the regexp above with the code you wish you had
 create_admin
 sign_in
 
end

When /^I visit the users page$/ do
  #pending # express the regexp above with the code you wish you had
visit users_path
end

Then /^I should see a list of users$/ do
  #pending # express the regexp above with the code you wish you had

page.should have_content('Users')
end