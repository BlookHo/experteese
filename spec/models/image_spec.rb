require 'rails_helper'

RSpec.describe Image, type: :model do
  # TODO: Практическое занятие 'Тесты модели' image_spec.rb

  describe Image do
    let(:current_user) { User.first }
    let(:current_user_id) { current_user.id }
    let(:current_image) { Image.first }
    let(:current_image_id) { current_image.id }

    before do
      # User
      FactoryGirl.create(:user)
      FactoryGirl.create(:user, :user_2)
      FactoryGirl.create(:user, :user_3)
      # puts "before All: User.first.id = #{User.first.id}\n"

      # Image
      FactoryGirl.create(:image)
      FactoryGirl.create(:image, :image_2)
      FactoryGirl.create(:image, :image_3)
      FactoryGirl.create(:image, :image_4) #  ave_value = 80
      # puts "before All: Image.first.id = #{Image.first.id}\n"

      # Value
      FactoryGirl.create(:value)
    end

    describe 'Method Image.update_ave_value test' do # ,  focus: true
      context 'when before actions - check tables values' do
        context 'when User have rows count - Ok' do
          let(:rows_qty) { 3 }

          it_behaves_like :successful_users_rows_count
        end

        context 'when Image have rows count - Ok' do
          let(:rows_qty) { 4 }

          it_behaves_like :successful_images_rows_count
        end

        context 'when Value have rows count - Ok' do
          let(:rows_qty) { 1 }

          it_behaves_like :successful_values_rows_count
        end

        context 'when field value in Image - Ok' do
          let(:image_ave_value) { Image.find(current_image_id).ave_value }

          it 'check ave_value in Image' do
            expect(image_ave_value).to eq(0)
          end
        end
      end

      context 'when model method create value and update ave_value -' do
        context 'when ave_value update after value create -' do
          let(:new_value_data) do
            { user_id: current_user_id, image_id: current_image_id, value: 40 }
          end
          let(:value_second) { Value.second.attributes.except('id', 'created_at', 'updated_at') }
          let(:ave_value) { Value.calc_average_value(current_image_id).round }
          let(:updated_value) { Image.find(current_image_id).ave_value }

          before do
            Value.create(new_value_data)
            Image.update_ave_value(current_image_id, ave_value)
          end

          it '- after create value - Ok' do
            # puts "in It: value_second = #{value_second} \n"
            # puts "in It create value: new_value_data = #{new_value_data.inspect} \n"
            expect(value_second).to eq('user_id' => current_user_id,
                                       'image_id' => current_image_id,
                                       'value' => 40)
          end

          it '- after create value and calculate average value - Ok' do
            # puts "in It: ave_value = #{ave_value} \n"
            expect(ave_value).to eq(40)
          end

          it '- after create value, calculate average value and update ave_value - Ok' do
            # puts "in It: current_image.id = #{current_image.id} \n"
            # puts "in It: updated_value in Image = #{updated_value} \n"
            expect(updated_value).to eq(40)
          end
        end

        context 'when check Image.value_and_update after one value create -' do
          let(:new_value_data) do
            { user_id: current_user_id, image_id: current_image_id, value: 40 }
          end
          let(:updated_value) { Image.find(current_image_id).ave_value }

          before { Image.value_and_update(new_value_data) }

          it '- after create value - Ok' do
            # puts "in last It create value: new_value_data = #{new_value_data.inspect} \n"
            # puts "in last It: current_image.id = #{current_image.id} \n"
            expect(updated_value).to eq(40)
          end
        end

        context 'when value_and_update return valued_image_data after one value created -' do
          let(:new_value_data) do
            { user_id: current_user_id, image_id: current_image_id, value: 40 }
          end
          let(:valued_image_data) { Image.value_and_update(new_value_data) }
          let(:updated_value) { Image.find(current_image_id).ave_value }

          it '- after create value and return valued_image_data - Ok' do
            # puts "in last It create value: new_value_data = #{new_value_data.inspect} \n"
            # puts "in last It create value: updated_value = #{updated_value.inspect} \n"
            expect(valued_image_data).to eq(values_qty: 2, current_user_id: 25, theme_id: nil,
                                            image_id: 33, user_valued: 1, value: 40,
                                            common_ave_value: 40)
          end
        end
      end
    end
  end
end
