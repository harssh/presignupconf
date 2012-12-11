require "spec_helper"
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe UserMailer do
 
 before(:all) do
   @user = FactoryGirl.create(:user,name: "exuser",email: "exa1234@example.com",password: "example",password_confirmation: "example" )
   @email1 = UserMailer.welcome_email(@user).deliver
   @email2 = UserMailer.activation_email(@user).deliver
    
 end
 
 it "should be deliverd to correct address" do
   @email1.to.should == [@user.email]
   
   @email2.to.should == [@user.email]
   
 end 
 
 it "should have correct subject" do
   @email1.subject.should == 'Thank You for Registration'
   
   @email2.subject.should ==  'Your account has been activated'
 end
  
  it "should have correct body text" do
    @email1.body.encoded.should match("You have successfully signed up to example.com")
    @email2.body.encoded.should match("Welcome")
  end 
  DatabaseCleaner.clean
end
