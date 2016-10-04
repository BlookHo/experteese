FactoryGirl.define do
  factory :value, class: Value do
    user_id   1
    image_id  1
    value     50
  end
  
  trait :value_2 do
    user_id   2
    image_id  1
    value     30
  end
  
  trait :value_3 do
    user_id   1
    image_id  2
    value     40
  end

  trait :value_4 do
    user_id   2
    image_id  2
    value     60
  end

end
