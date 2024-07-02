# frozen_string_literal: true

require "rails_helper"

RSpec.describe MortgageCalculatorService do
  describe "initialization" do
    it "initializes with loan amount, interest rate, and term" do
      calculator = MortgageCalculatorService.new(100000, 3.2, 2)
      expect(calculator).to be_a(MortgageCalculatorService)
    end
  end

  describe "#calculate" do
    it "calculates the correct monthly payment" do
      calculator = MortgageCalculatorService.new(100000, 3.2, 2)
      monthly_payment = calculator.calculate
      expect(monthly_payment).to be_within(0.01).of(4306.97)
    end
  end
end
