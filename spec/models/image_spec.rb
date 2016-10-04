require 'rails_helper'

RSpec.describe Image, type: :model do
  
  # todo: Практическое занятие "Тесты модели"  image_spec.rb
   describe "Image model tests" do
    
    before {
      
      # User
      FactoryGirl.create(:user)
      FactoryGirl.create(:user, :user_2)
      FactoryGirl.create(:user, :user_3 )
      puts "before All: User.first.id = #{User.first.id} \n"
      
      # Image
      FactoryGirl.create(:image)
      FactoryGirl.create(:image, :image_2)
      FactoryGirl.create(:image, :image_3)
      FactoryGirl.create(:image, :image_4)  # ave_value = 80
      puts "before All: Image.first.id = #{Image.first.id} \n"

      # Value
      FactoryGirl.create(:value)
            
    }

    let(:current_user) { User.first }
    let(:current_user_id) {current_user.id}
    let(:current_image) { Image.first }
    let(:current_image_id) { current_image.id }

    describe 'Method Image.update_ave_value test'   do  # , focus: true
  
      context '- before actions - check tables values ' do
        describe '- check User have rows count - Ok' do
          let(:rows_qty) {3}
          it_behaves_like :successful_users_rows_count
        end
        describe '- check Image have rows count - Ok' do
          let(:rows_qty) {4}
          it_behaves_like :successful_images_rows_count
        end
        describe '- check Value have rows count - Ok' do
          let(:rows_qty) {1}
          it_behaves_like :successful_values_rows_count
        end

        describe '- check field value in Image - Ok' do
          let(:image_ave_value) {Image.find(current_image_id).ave_value}
          it 'check ave_value in Image' do
            expect(image_ave_value).to eq(0)
          end
        end
      end

      context '- check model method create value and update ave_value -' do
      
        describe '- check ave_value update after value create -' do
          let(:new_value_data) { { user_id: current_user_id, image_id: current_image_id, value: 40 } }
          before { Value.create(new_value_data ) }
          let(:value_second) { Value.second.attributes.except('id', 'created_at','updated_at') }
          it '- after create value - Ok' do
            puts "in It: value_second = #{value_second} \n"
            puts "in It create value: new_value_data = #{new_value_data.inspect} \n"
            expect(value_second).to eq({"user_id"=>current_user_id,
                                        "image_id"=>current_image_id,
                                        "value"=>40})
          end
          let(:ave_value) { Value.calc_average_value(current_image_id).round }
          it '- after create value and calculate average value - Ok' do
            puts "in It: ave_value = #{ave_value} \n"
            expect(ave_value).to eq(40)
          end
          before { Image.update_ave_value(current_image_id, ave_value) }
          let(:updated_value) { Image.find(current_image_id).ave_value }
          it '- after create value, calculate average value and update ave_value - Ok' do
            puts "in It: current_image.id = #{current_image.id} \n"
            puts "in It: updated_value in Image = #{updated_value} \n"
            expect(updated_value).to eq(40)
          end
        end

        describe '- check Image.value_and_update after one value create -' do
          let(:new_value_data) { { user_id: current_user_id, image_id: current_image_id, value: 40 } }
          before { Image.value_and_update(new_value_data ) }
          let(:updated_value) { Image.find(current_image_id).ave_value }
          it '- after create value - Ok' do
            puts "in last It create value: new_value_data = #{new_value_data.inspect} \n"
            puts "in last It: current_image.id = #{current_image.id} \n"
            puts "in last It create value: current_image.ave_value = #{current_image.ave_value.inspect} \n"
            puts "in last It create value: updated_value = #{updated_value.inspect} \n"
            expect(updated_value).to eq(40)
          end
        end
        
        describe '- check Image.value_and_update with return valued_image_data after one value created -' do
          let(:new_value_data) { { user_id: current_user_id, image_id: current_image_id, value: 40 } }
          let(:valued_image_data) { Image.value_and_update(new_value_data )}
          let(:updated_value) { Image.find(current_image_id).ave_value }
          it '- after create value and return valued_image_data - Ok' do
            puts "in last It create value: new_value_data = #{new_value_data.inspect} \n"
            puts "in last It: current_image.id = #{current_image.id} \n"
            puts "in last It create value: current_image.ave_value = #{current_image.ave_value.inspect} \n"
            puts "in last It create value: updated_value = #{updated_value.inspect} \n"
            expect(valued_image_data).to eq({:values_qty=>2, :current_user_id=>25, :theme_id=>nil,
                                             :image_id=>33, :user_valued=>1, :value=>40,
                                             :common_ave_value=>40})
          end
        end


      end
    end

  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  end
