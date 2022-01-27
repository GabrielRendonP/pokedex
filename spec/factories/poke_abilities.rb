FactoryBot.define do
  factory :poke_ability do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
  end
end
