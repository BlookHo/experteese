require 'rails_helper'
require 'spec_helper'

RSpec.describe "AuthenticationPages", type: :request do
  # describe "GET /authentication_pages" do
  #   it "works! (now write some real specs)" do
  #     get authentication_pages_index_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

  describe "Authentication" do
    subject { page }
    before { visit signin_path }

    
    describe "signin page"   do  # , focus: true
      it { should have_content( 'Войти')  }
      it { should have_title('Sign in') }
    end

    describe "with valid information"     do  #  , focus: true
      let(:user) { FactoryGirl.create(:user, :user_2) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Пароль", with: user.password
        click_button "Sign in"
      end

      it { should have_title('Work with Images') }
      # it { should have_content(user.email) }
      it { should have_content('Select theme') }
      # goto work/index
      
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
     
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
            
    end

    describe "with invalid information" do
      before { click_button "Sign in" }
  
      it { should have_title('Sign in') }
      it { should have_selector('div.alert.flash') }
  
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.flash') }
      end
    end
    
  end
  
  
end
