FactoryGirl.define do
  factory :user do
    email "Mike@mike.com"
    password "12345678"
    password_confirmation "12345678"
  end

  factory :question  do
    title "blahblah"
    content "blah blah blah"
  end

  factory :answer do
    content "oh blah blah?"
  end
end
