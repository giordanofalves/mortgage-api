
# frozen_string_literal: true

class MortgageCalculatorService
  def initialize(loan_amount, interest_rate, loan_term)
    @loan_amount   = loan_amount
    @interest_rate = interest_rate
    @loan_term     = loan_term
  end

  def calculate
    monthly_interest_rate = @interest_rate / 100 / 12
    loan_term_in_months   = @loan_term * 12
    monthly_payment       = (@loan_amount * monthly_interest_rate) / (1 - (1 + monthly_interest_rate)**-loan_term_in_months)

    monthly_payment.round(2)
  end
end
