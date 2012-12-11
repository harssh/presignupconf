namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    
    
  end

end

def make_users
  
     admin = User.create!(name: "Exampl User",email: "example@railstutorial.org",password: "foobar",password_confirmation: "foobar")
  #This adds boolean admin  true to admin 
  admin.toggle!(:admin)
  admin.toggle!(:approved)
  
  siuser = User.create!(name: "Harssh",email: "harssh122@gmail.com",password: "123456",password_confirmation: "123456")
 #  siuser.toggle!(:approved)
  
 98.times do |n|
   name = Faker::Name.name
   email = "example-#{n+1}@railstutorial.org"
   password = "password"
   User.create!(name: name,email: email,password: password,password_confirmation: password)
   
   end
 
end


 
  