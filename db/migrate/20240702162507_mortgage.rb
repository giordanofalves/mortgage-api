# frozen_string_literal: true

class Mortgage < ActiveRecord::Migration[7.1]
  def change
    create_table :mortgages do |t|
      t.string :applicant_name
      t.decimal :loan_amount
      t.decimal :interest_rate
      t.integer :loan_term
      t.decimal :monthly_payment
      t.integer :status,  default: 0

      t.timestamps
    end
  end
end
