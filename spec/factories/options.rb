FactoryBot.define do
  factory :option do
    campaign { create(:campaign) }
    name { Faker::Lorem.word }
  end
end
