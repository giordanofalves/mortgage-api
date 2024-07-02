# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::MortgagesController, type: :controller do
  let!(:mortgage) { create(:mortgage) }

  before do
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials("admin", "password")
    request.env["HTTP_AUTHORIZATION"] = credentials
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, format: :json

      expect(response).to be_successful
      expect(assigns(:mortgages)).to eq([mortgage])
    end

    context "when not authenticated" do
      before do
        request.env["HTTP_AUTHORIZATION"] = nil
      end

      it "returns http unauthorized" do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: mortgage.to_param }, format: :json
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_attributes) { { applicant_name: "Jane Doe", loan_amount: 10000, interest_rate: 4.5, loan_term: 2 } }

      it "creates a new Mortgage" do
        expect {
          post :create, params: { mortgage: valid_attributes }, format: :json
        }.to change(Mortgage, :count).by(1)
      end

      it "renders a JSON response with the new mortgage" do
        post :create, params: { mortgage: valid_attributes }, format: :json
        returned_data = JSON.parse(response.body)

        expect(response).to have_http_status(:created)
        expect(returned_data["applicant_name"]).to eq("Jane Doe")
        expect(returned_data["loan_amount"]).to eq("$10,000.00")
        expect(returned_data["interest_rate"]).to eq("4.5%")
        expect(returned_data["loan_term"]).to eq(2)
        expect(returned_data["monthly_payment"]).to eq("$436.48")
        expect(returned_data["status"]).to eq("pending")
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { { loan_amount: 200000, interest_rate: 4.5, loan_term: 20 } }

      it "renders a JSON response with an error" do
        post :create, params: { mortgage: invalid_attributes }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq("applicant_name" => ["can't be blank"])
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { loan_amount: 150000 } }

      it "updates the requested mortgage" do
        put :update, params: { id: mortgage.to_param, mortgage: new_attributes }, format: :json
        mortgage.reload
        expect(mortgage.loan_amount).to eq(150000)
      end

      it "renders a JSON response with the mortgage" do
        put :update, params: { id: mortgage.to_param, mortgage: new_attributes }, format: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested mortgage" do
      expect {
        delete :destroy, params: { id: mortgage.to_param }, format: :json
      }.to change(Mortgage, :count).by(-1)
    end

    it "renders a JSON response with a success message" do
      delete :destroy, params: { id: mortgage.to_param }, format: :json
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["message"]).to eq("Mortgage deleted successfully")
    end
  end
end
