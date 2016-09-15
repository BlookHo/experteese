require 'rails_helper'
require 'spec_helper'

RSpec.describe "UserPages", type: :request do
  describe "GET /user_pages" do
    it "works!" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
  
  subject { page }
  # let(:this_user) { FactoryGirl.create(:user) }
  # let(:current_user) { create(:user) }

  describe "signup page" do
    before { visit signup_path }
    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "profile page" do
    let(:current_user) { FactoryGirl.create(:user) }
    before { visit user_path(current_user) }
  
    it {
      should have_content(current_user.name)
      should have_content(current_user.email)
      should have_title(current_user.name)
    }
  end


end
