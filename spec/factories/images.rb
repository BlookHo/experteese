FactoryGirl.define do
  factory :image, class: Image do
  
    name        "P. Picasso, Фабрика"
    file        "Picasso Fabrique.jpg"
    ave_value   0
    theme_id    1
    
  end
  
  trait :image_2 do
    name        "P. Picasso, Герника"
    file        "Picasso Герника.jpg"
    ave_value   0
    theme_id    1
  end
  
  trait :image_3 do
    name        "P. Picasso, Авиньонские девицы"
    file        "Picasso Авиньонские девицы.jpg"
    ave_value   0
    theme_id    1
  end

  trait :image_4 do
    name        "H. Matiss, Танец"
    file        "Matiss Танец.jpg"
    ave_value   80
    theme_id    2
  end

end
