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

  describe "signup page" do
  
    before { visit signup_path }
    let(:submit) { "Create my account" }
  
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
  
    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
    
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        # let(:user) { User.find_by(email: 'user@example.com') }
        it { should have_selector('a' ) }
      end


    end
  end



end
