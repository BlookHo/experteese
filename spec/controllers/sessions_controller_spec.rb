require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  # before { @user = User.new(name: "Example User", email: "user@example.com",
  #                           password: "foobar", password_confirmation: "foobar" ) }
  #
  # subject { @user }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(302)
      # todo: 302 instead success?
    end
  end
  
end
