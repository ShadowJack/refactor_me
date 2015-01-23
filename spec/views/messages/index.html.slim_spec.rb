require 'rails_helper'

RSpec.describe "messages/index", :type => :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :user_id => 1,
        :topic_id => 2,
        :content => "MyText",
        :votes_up => 3,
        :votes_down => 4
      ),
      Message.create!(
        :user_id => 1,
        :topic_id => 2,
        :content => "MyText",
        :votes_up => 3,
        :votes_down => 4
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
