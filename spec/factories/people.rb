FactoryBot.define do
  factory :person do
    sequence(:first_name) { |number| "Example #{number}" }
    last_name { "Person" }
    sequence(:email) { |number| "person-#{number}@example.com" }
  end
end
