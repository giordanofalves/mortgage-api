# frozen_string_literal: true

# == Schema Information
#
# Table name: mortgages
#
#  id              :bigint           not null, primary key
#  applicant_name  :string
#  loan_amount     :decimal(, )
#  interest_rate   :decimal(, )
#  loan_term       :integer
#  monthly_payment :decimal(, )
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Mortgage < ApplicationRecord
  enum status: { pending: 0, approved: 1, rejected: 2 }

  validates :applicant_name, presence: true
  validates :loan_amount, presence: true, numericality: { greater_than: 0 }
  validates :interest_rate, presence: true, numericality: { greater_than: 0 }
  validates :loan_term, presence: true, numericality: { greater_than: 0 }

  before_save :calculate_monthly_payment

  private

  def calculate_monthly_payment
    self.monthly_payment = MortgageCalculatorService.new(loan_amount, interest_rate, loan_term).calculate
  end
end
