FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'Testovitch'
    username 'test_user'
    email { "#{first_name}_#{last_name}@test.com".downcase }
    password 'p@ssw0rd'
    about_me ''
    born_at { 24.years.ago }
  end

end