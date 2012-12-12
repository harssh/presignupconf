namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    
    
  end

end

def make_users
  
     admin = User.create!(name: "Exampl User",email: "example@example.org",password: "123456",password_confirmation: "123456")
  #This adds boolean admin  true to admin 
  admin.toggle!(:admin)
  admin.toggle!(:approved)
  
  siuser = User.create!(name: "Harssh",email: "harssh122@gmail.com",password: "123456",password_confirmation: "123456")
  siuser.toggle!(:approved)
  
  siuser = User.create!(name: "Ramesh",email: "Ramesh@gmail.com",password: "123456",password_confirmation: "123456")
  siuser.toggle!(:approved)
  
siuser1 = User.create!(name: "Harsh",email: "harssh219@gmail.com",password: "123456",password_confirmation: "123456")
  #siuser.toggle!(:approved)

 30.times do |n|
   name = Faker::Name.name
   email = "example-#{n+1}@railstutorial.org"
   password = "password"
   User.create!(name: name,email: email,password: password,password_confirmation: password)
   
   end
 
end


 
  