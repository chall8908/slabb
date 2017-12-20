FactoryBot.define do
  factory :post do
    creator { create(:user) }
    title   "This is a test title"
    body    "This is a test body"
  end
end
