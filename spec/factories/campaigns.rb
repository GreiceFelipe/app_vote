FactoryBot.define do
  factory :campaign do
    title { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph(sentence_count: 4) }
    user { create(:user) }
    finished { false }
  end
end
