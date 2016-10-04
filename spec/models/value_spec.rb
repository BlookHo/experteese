require 'rails_helper'

RSpec.describe Value, type: :model do
  
  describe "User and Values to Image" do
  
    before {
      
      # User
      FactoryGirl.create(:user)             # User = 1.
      FactoryGirl.create(:user, :user_2)    # User = 2.
      FactoryGirl.create(:user, :user_3 )   # User = 3 .
      puts "before All: User.first.id = #{User.first.id} \n"
  
      # Image
      FactoryGirl.create(:image)            # Image = 1.
      FactoryGirl.create(:image, :image_2)  # Image = 2.
      FactoryGirl.create(:image, :image_3)  # Image = 3.
      puts "before All: Image.first.id = #{Image.first.id} \n"
  
    }

    # after{
    #   # DatabaseCleaner.clean
    #   User.reset_pk_sequence
    #   # Image.reset_pk_sequence
    #   # Value.reset_pk_sequence
    #
    # }
    
    let(:current_user) { User.first }
    let(:current_user_id) {current_user.id}

    # Value create
    describe 'Method Value.create test'   do  # , focus: true
      
      context '- before actions - check tables values ' do
        describe '- check User have rows count - Ok' do
          let(:rows_qty) {3}
          it_behaves_like :successful_users_rows_count
        end
        describe '- check Image have rows count - Ok' do
          let(:rows_qty) {3}
          it_behaves_like :successful_images_rows_count
        end
        describe '- check Value have rows count - Ok' do
          let(:rows_qty) {0}
          it_behaves_like :successful_values_rows_count
        end
      end

      context "- Check Method create for Value model -"   do  # , focus: true
        let(:current_user_id) { User.first.id }   # [1]
        let(:current_image_id) { Image.first.id } # [1]

        let(:new_value_data) { { user_id: current_user_id, image_id: current_image_id, value: 40 } }
        before { Value.create(new_value_data ) }
        
        it '- after create value - Ok' do
          value_first =  Value.first.attributes.except('created_at','updated_at')
          puts "in It: current_user_id = #{current_user_id} \n" # id = 1
          puts "in It create value: new_value_data = #{new_value_data.inspect} \n"
          expect(value_first).to eq({"id"=>1, "user_id"=>current_user_id, "image_id"=>current_image_id, "value"=>40})
        end
        it '- check value_first.id - Ok' do
          value_first =  Value.first.attributes.except('created_at','updated_at')
          puts "in It: current_user_id = #{current_user_id} \n" # id = 1
          puts "in It: value_first.id = #{value_first["id"].inspect} \n"
          expect(value_first["id"]).to eq(2)
        end
        describe '- check Value have rows count - Ok' do
          let(:rows_qty) {1}
          it_behaves_like :successful_values_rows_count
        end

      end

      context '- before actions - check tables values ' do
        describe '- check User have rows count - Ok' do
          let(:rows_qty) {3}
          it_behaves_like :successful_users_rows_count
        end
        describe '- check Image have rows count - Ok' do
          let(:rows_qty) {3}
          it_behaves_like :successful_images_rows_count
        end
        describe '- check Value have rows count - Ok' do
          let(:rows_qty) {0}
          it_behaves_like :successful_values_rows_count
        end
      end

    end
    
    
    
  end
    
end
