FactoryBot.define do
  factory :pokemon do
    name { Faker::Name.name }
  end
end
