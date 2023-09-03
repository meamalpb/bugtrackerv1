FactoryBot.define do
    factory :project do
      name { Faker::Company.name }
      Description {Faker::Company.industry}
    end
end
    