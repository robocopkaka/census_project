# frozen_string_literal: true

# Seed mongo database
50.times do
  Person.create!(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    age: Faker::Number.within(range: 0..100),
    gender: ["male", "female", "trans"].sample,
    height: Faker::Number.between(from: 140, to: 200),
    city: Faker::Address.city,
    country: Faker::Address.country,
    degrees: %w(Bachelors Masters)
  )
end