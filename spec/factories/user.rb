FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "email#{n}@test.net" }
    rank 'user'
    password { Base64.strict_encode64(SecureRandom.random_bytes(64)) }
  end
end
