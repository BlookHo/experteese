FactoryGirl.define do
  factory :user, class: User do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  trait :user_2 do
    name     "Rails Tutorial"
    email    "example@railstutorial.org"
    password "222222"
    password_confirmation "222222"
  end

end
