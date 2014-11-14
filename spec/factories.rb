FactoryGirl.define do

  factory :user do
    name 'Ivan'
    email 'test@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end
