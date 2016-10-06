require 'rails_helper'

RSpec.describe MainController, type: :controller    do #  , focus: true


  let(:base_title) {"Experteese RoR Sample App"}
  
  describe 'CHECK MainController methods'  do  #
    # let(:connected_users) { current_user.get_connected_users }

    subject { page }
    
    describe "GET #root" do
      context '- check the root route: render_template & response status'     do
        subject { get :root }
        it "renders the :index template" do
          expect(get: root_url(subdomain: nil)).to route_to(controller: "main", action: "index")
        end
        it '- responds with 200' do
          expect(response.status).to eq(200)
        end
        it '- no responds with 401' do
          expect(response.status).to_not eq(401)
        end
      end
      context '- check visit the root path'   do
        before { visit root_path }
  
        it { should have_content ('Добро пожаловать в Experteese') }
        it { should have_title(full_title('')) }
        it { should_not have_title('| Index') }
        
      end
      context 'check links '   do  # заполнить
        before { visit root_path }
        it "should have the right links on the layout" do
          click_link "О сайте"
            expect(page).to have_title(full_title('About'))
          click_link "Помощь"
            expect(page).to have_title(full_title('Help'))
          click_link "Главная"
          click_link "Контакты"
            expect(page).to have_title(full_title('Contacts'))
          click_link "Главная"
          click_link "Регистрация"
            expect(page).to have_title(full_title('Sign up'))
          click_link "Experteese"
            expect(page).to have_title(full_title(''))
          click_link "Главная"
            expect(page).to have_title(full_title(''))
        end

      end
    end
    
    
    describe "GET #index" do
      context '- after action <index> - check render_template & response status'   do
        subject { get :index }
        it "- render_template index" do
          puts "Check #index\n"
          puts "base_title = #{base_title}\n "
          expect(subject).to render_template :index
        end
        it '- responds with 200' do
          expect(response.status).to eq(200)
        end
        it "returns http success" do
          expect(subject).to have_http_status(:success)
        end
        it '- no responds with 401' do
          expect(response.status).to_not eq(401)
        end
        
                
        it "returns page.title correct"    do
          get :index
          # puts response.body
          expect(response.body).to have_selector("title", :text => "Index | Experteese RoR Sample App", :visible => false)
        end
        # it "should have the content 'Index'" do
        #   visit index_path
        #   expect(page).to have_content('Index')
        # end
        # it "should have the title 'Index'" do
        #   visit index_path
        #   expect(page).to have_title("Index | #{base_title}")
        # end

      end
      
      context '- check visit the index_path'  do
        before { visit index_path }
  
        # it { should have_content ('Index') }
        # it { should have_title ("Index | #{base_title}") }
        it { should have_title(full_title('Index')) }
        it { should_not have_title('| Index') }
      end

    end
             
    # describe "GET #create" do
    #   it "returns http success" do
    #     get :create
    #     expect(response).to have_http_status(:success)
    #   end
    # end
    
    describe "GET #help"   do
      before(:each) { get :help }
        it "returns http success"   do
        puts "Check #help\n"
        expect(response).to have_http_status(:success)
      end
      it "returns page.title correct"   do
        expect(response.body).to have_selector("title", :text => "Help | #{base_title}", :visible => false)
      end
      # it "should have the content 'Help'" do
      #   visit help_path
      #   expect(page).to have_content('Help')
      # end
      # it "should have the title 'Help'" do
      #   visit help_path
      #   expect(page).to have_title("Help | #{base_title}")
      # end

      context '- check visit the help_path'  do
        before { visit help_path }
  
        it { should have_content ('Пользовательский интерфейс Experteese построен по принципу "одностраничного приложения".') }
        # it { should have_title ("Index | #{base_title}") }
        it { should have_title(full_title('Help')) }
        it { should_not have_title('| Help') }
      end

    end
    
    describe "GET #contacts"    do
      before(:each) { get :contacts }
      it "returns http success" do
        puts "Check #contacts\n"
          expect(response).to have_http_status(:success)
      end
      it "returns page.title correct" do
        expect(response.body).to have_selector("title", :text => "Contacts | #{base_title}", :visible => false)
      end
      it 'has correct H1 tag' do
        h1_text = 'Контакты'
        expect(response.body).to have_selector('h1', text: h1_text)
      end
      context '- check visit the contacts_path' do
        before { visit contacts_path }
  
        it { should have_content ('Приложение Experteese разработано в качестве практического материала') }
        # it { should have_title ("Index | #{base_title}") }
        it { should have_title(full_title('Contacts')) }
        it { should_not have_title('| Contacts') }
      end

    end

    describe "GET #about"    do
      # subject { get :about }
      before(:each) { get :about }
      it "returns http success" do
        puts "Check #about\n"
        expect(response).to have_http_status(:success)
      end
      it "returns page.title correct" do
        expect(response.body).to have_selector("title", :text => "About | #{base_title}", :visible => false)
      end
      it 'has correct H1 tag' do
        h1_text = 'О сайте'
        expect(response.body).to have_selector('h1', text: h1_text)
      end
      # it "should have the content 'About'" do
      #   # visit '/main/contacts'
      #   visit about_path
      #   expect(page).to have_content('About')
      # end
      # it "should have the title 'About'" do
      #   visit about_path
      #   expect(page).to have_title("About | #{base_title}")
      # end
      
      context '- check visit the about_path' do
        before { visit about_path }
  
        it { should have_content ('Приложение Experteese предназначено для сбора оценок предпочтений пользователей.') }
        it { should have_title(full_title('About')) }
        it { should_not have_title('| About') }
      end


      context '- check visit the work_path'   do
        before { visit work_path }
  
        it { should have_content ('Выберите тему для оценки') }
        it { should have_title(full_title('Work with Images')) }
        it { should_not have_title('| Work with Images') }
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
