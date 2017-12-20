FactoryBot.define do
  factory :message do
    sender    { create(:user) }
    recipient { create(:user) }
    title     "This is a test title"
    body      "This is a test body"
  end
end
