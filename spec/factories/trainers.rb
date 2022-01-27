FactoryBot.define do
  factory :trainer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10) }
    password_confirmation { password }
  end
end
