# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    user_id 1
    topic_id 1
    content "MyText"
    votes_up 1
    votes_down 1
  end
end
