class UserMailer < ActionMailer::Base
  default from: "admin@example.com"

def welcome_email(user)
   @user = user
  @url = " http://0.0.0.0:3000"
  
  mail(:to => user.email, :subject => "Thank You for Registration")
end

def activation_email(user)
  @user = user
  @url = " http://0.0.0.0:3000"
  
  mail(:to => user.email, :subject => "Your account has been activated")
end

end
