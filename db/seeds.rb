# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
20.times do 
    User.create({email: Faker::Internet.email , name: Faker::Name.name , password: '123123'})  
end
10.times do 
    Project.create({name: Faker::Company.name, Description: Faker::Company.industry, project_lead_id: rand(1..10) })
end

100.times do 
    project = Project.find(rand(1..10))
    user = User.find(rand(1..20))
    unless project.users.include? user
        project.users << user
    end
end