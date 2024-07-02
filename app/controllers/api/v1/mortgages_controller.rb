# frozen_string_literal: true

class Api::V1::MortgagesController < ApplicationController
  before_action :set_mortgage, only: %i[ show update destroy ]

  def index
    @mortgages = Mortgage.all
  end

  def show; end

  def create
    @mortgage = Mortgage.new(mortgage_params)

    if @mortgage.save
      render "api/v1/mortgages/show", status: :created
    else
      render json: @mortgage.errors, status: :unprocessable_entity
    end
  end

  def update
    if @mortgage.update(mortgage_params)
      render "api/v1/mortgages/show", status: :ok
    else
      render json: @mortgage.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @mortgage.destroy
      render json: { message: "Mortgage deleted successfully" }, status: :ok
    else
      render json: @mortgage.errors, status: :unprocessable_entity
    end
  end

  private

  def set_mortgage
    @mortgage = Mortgage.find(params[:id])
  end

  def mortgage_params
    params.require(:mortgage).permit(:applicant_name,
                                     :loan_amount,
                                     :interest_rate,
                                     :loan_term,
                                     :status)
  end
end
