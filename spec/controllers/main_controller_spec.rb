require 'rails_helper'

RSpec.describe MainController, type: :controller    do #  , focus: true

  # let(:current_user) { create(:user) }   # User = 1. Tree = 1. profile_id = 63
  # let(:currentuser_id) {current_user.id}
  #
  # before {
  #   allow(controller).to receive(:logged_in?)
  #   allow(controller).to receive(:current_user).and_return current_user
  #
  #   FactoryGirl.create(:user, :user_2)  # User = 2. Tree = 2. profile_id = 66
  #   FactoryGirl.create(:user, :user_3 )  # User = 3 . Tree = [3]. profile_id = 22
  #   FactoryGirl.create(:user, :user_4 )  # User = 4 . Tree = 10. profile_id = 444
  #   # puts "before All: current_user.id = #{current_user.id} \n" # id = 1
  #   # puts "before All: User.last.id = #{User.last.id} \n" # id = 2
  #   # puts "before All: User.find(2).profile_id = #{User.find(2).profile_id} \n" # id = 2 profile_id = 66
  #
  #   FactoryGirl.create(:connected_user, :correct)      # 1  2
  #   FactoryGirl.create(:connected_user, :correct_3_4)  # 3  4
  #   # puts "before All: ConnectedUser.count = #{ConnectedUser.all.count} \n" # 2 rows
  #
  #   # Profile
  #   FactoryGirl.create(:profile, :profile_63)
  #   FactoryGirl.create(:profile, :profile_64)
  #   FactoryGirl.create(:profile, :profile_65)
  #   FactoryGirl.create(:profile, :profile_66)
  #   FactoryGirl.create(:profile, :profile_67)
  #   FactoryGirl.create(:profile, :profile_68)
  #   FactoryGirl.create(:profile, :profile_69)
  #   FactoryGirl.create(:profile, :profile_70)
  #   FactoryGirl.create(:profile, :profile_78)
  #   FactoryGirl.create(:profile, :profile_79)
  #   FactoryGirl.create(:profile, :profile_80)
  #   FactoryGirl.create(:profile, :profile_81)
  #   FactoryGirl.create(:profile, :profile_82)
  #   FactoryGirl.create(:profile, :profile_83)
  #   FactoryGirl.create(:profile, :profile_84)
  #   # puts "before All: Profile.find(63).user_id = #{Profile.find(63).user_id.inspect} \n"  # id = 63
  #   # puts "before All: Profile.find(66).name_id = #{Profile.find(66).name_id.inspect} \n"  # id = 66
  #   # puts "before All: Profile.last.id = #{Profile.last.id} \n"  # id = 64
  #   # puts "before All: Profile.last.name_id = #{Profile.last.name_id} \n"  # name_id = 90
  #   # puts "before All: Profile.count = #{Profile.all.count} \n" # 2
  #
  # }
  #
  # after {
  #   User.delete_all
  #   User.reset_pk_sequence
  #   ConnectedUser.delete_all
  #   ConnectedUser.reset_pk_sequence
  #   Tree.delete_all
  #   Tree.reset_pk_sequence
  #   Profile.delete_all
  #   Profile.reset_pk_sequence
  #   Name.delete_all
  #   Name.reset_pk_sequence
  # }

  describe 'CHECK MainController methods'  do  # , focus: true
    # let(:connected_users) { current_user.get_connected_users }

    # context '- before actions - check connected_users' do
    #   # let(:connected_users) { current_user.get_connected_users }
    #   it "- Return proper connected_users Array result for current_user_id = 1" do
    #     puts "Check CommonLogsController \n"
    #     puts "Before All - data created \n"  #
    #     # puts "In check connected_users :  connected_users = #{connected_users} \n"
    #     expect(connected_users).to be_a_kind_of(Array)
    #   end
    #   it "- Return proper connected_users Array result for current_user_id = 1" do
    #     # puts "1 2 In check connected_users :  connected_users = #{connected_users} \n"
    #     expect(connected_users).to eq([1,2])
    #   end
    # end

    describe "GET #index" do
      context '- after action <index> - check render_template & response status' do
        subject { get :index }
        it "- render_template index" do
          puts "Check #index\n"
          # puts "In render_template :  currentuser_id = #{currentuser_id} \n"
          expect(subject).to render_template :index
        end
        it '- responds with 200' do
          expect(response.status).to eq(200)
        end
        it "returns http success" do
          expect(subject).to have_http_status(:success)
        end
        it '- no responds with 401' do
          # puts "In no responds with 401:  currentuser_id = #{currentuser_id} \n"
          expect(response.status).to_not eq(401)
        end
        it "returns page.title correct" do
          get :index
          expect(response.body).to have_selector("title", :text => "Index | Ruby on Rails Tutorial Sample App")
          # True if there is a title tag with text
        end

      end
    end
    
    
    # describe "GET #create" do
    #   it "returns http success" do
    #     get :create
    #     expect(response).to have_http_status(:success)
    #   end
    # end
    
    describe "GET #help" do
      before(:each) { get :help }
  
      it "returns http success" do
        puts "Check #help\n"
        # get :help
        expect(response).to have_http_status(:success)
      end
      it "returns page.title correct" do
        expect(response.body).to have_selector("title", :text => "Help | Ruby on Rails Tutorial Sample App")
        # True if there is a title tag with text
      end

    end
    # test "should get help" do
    #   get static_pages_help_url
    #   assert_response :success
    # end
    describe "GET #contacts" do
      # subject { get :contacts }
      before(:each) { get :contacts }

      it "returns http success" do
        # get :contacts
        puts "Check #contacts\n"
          expect(response).to have_http_status(:success)
      end
      it "returns page.title correct" do
        expect(response.body).to have_selector("title", :text => "Contacts | Ruby on Rails Tutorial Sample App")
        # True if there is a title tag with text
      end
      it 'has correct H1 tag' do
        h1_text = 'Contacts'
        expect(response.body).to have_selector('h1', text: h1_text)
      end

    end


    # describe "GET #destroy" do
    #   it "returns http success" do
    #     get :destroy
    #     expect(response).to have_http_status(:success)
    #   end
    # end

  end


end
