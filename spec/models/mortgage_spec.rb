# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mortgage, type: :model do
  describe "validations" do
    it { should validate_presence_of(:applicant_name) }
    it { should validate_presence_of(:loan_amount) }
    it { should validate_numericality_of(:loan_amount).is_greater_than(0) }
    it { should validate_presence_of(:interest_rate) }
    it { should validate_numericality_of(:interest_rate).is_greater_than(0) }
    it { should validate_presence_of(:loan_term) }
    it { should validate_numericality_of(:loan_term).is_greater_than(0) }
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values([:pending, :approved, :rejected]) }
  end

  describe "#calculate_monthly_payment" do
    let(:mortgage) { build(:mortgage, loan_amount: 100000, interest_rate: 5, loan_term: 30) }

    it "calculates the monthly payment before save" do
      expect(MortgageCalculatorService).to receive(:new).with(100000, 5, 30).and_call_original
      mortgage.save
      expect(mortgage.monthly_payment).not_to be_nil
    end
  end
end
