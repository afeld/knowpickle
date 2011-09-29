# This will guess the User class
FactoryGirl.define do
  factory :user do
    email 'user@knowpickle.com'
    password 'secret'
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, :class => User do
    email 'admin@knowpickle.com'
    password 'secret'
    role 'admin'
  end
end
