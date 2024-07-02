# frozen_string_literal: true

FactoryBot.define do
  factory :mortgage do
    applicant_name  { Faker::Name.name }
    loan_amount     { Faker::Number.decimal(l_digits: 5, r_digits: 2) }
    interest_rate   { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    loan_term       { Faker::Number.between(from: 1, to: 30) }

    traits_for_enum :status, Mortgage.statuses
  end
end
