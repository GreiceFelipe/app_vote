FactoryBot.define do
  factory :vote do
    campaign { create(:campaign) }
    option { create(:option) }
    voter { Faker::Crypto.sha1 }
  end
end
