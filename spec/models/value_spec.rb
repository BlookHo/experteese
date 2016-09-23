require 'rails_helper'

RSpec.describe Value, type: :model do
  
  describe "User and Values to Image" do
    # subject { page }
    # let(:current_user) { create(:user) }   # User = 1.
    # let(:currentuser_id) {current_user.id}
  
    before {
      # visit signin_path
      
      # User
      FactoryGirl.create(:user, :user_2)  # User = 2.
      FactoryGirl.create(:user, :user_3 )  # User = 3 .
      puts "before All: current_user.id = #{current_user.id} \n" # id = 1
  
  
      # Value
      
      
      
      
      # Image
      
      
      
    }
    
    # describe "signin page" do
    #
    #   let(:user) { FactoryGirl.create(:user, :user_2) }
    #
    #
    #   it { should have_content('Sign in') }
    #   it { should have_title('Sign in') }
    # end
    
    
  end
    
    # pending "add some examples to (or delete) #{__FILE__}"
end
