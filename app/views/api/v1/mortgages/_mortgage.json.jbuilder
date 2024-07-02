# frozen_string_literal: true

json.id              mortgage.id
json.applicant_name  mortgage.applicant_name
json.loan_amount     number_to_currency(mortgage.loan_amount)
json.interest_rate   number_to_percentage(mortgage.interest_rate, precision: 1)
json.loan_term       mortgage.loan_term
json.monthly_payment number_to_currency(mortgage.monthly_payment)
json.status          mortgage.status
json.created_at      mortgage.created_at
json.updated_at      mortgage.updated_at
