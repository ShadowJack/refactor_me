require 'rails_helper'

RSpec.describe "messages/new", :type => :view do
  before(:each) do
    assign(:message, Message.new(
      :user_id => 1,
      :topic_id => 1,
      :content => "MyText",
      :votes_up => 1,
      :votes_down => 1
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input#message_user_id[name=?]", "message[user_id]"

      assert_select "input#message_topic_id[name=?]", "message[topic_id]"

      assert_select "textarea#message_content[name=?]", "message[content]"

      assert_select "input#message_votes_up[name=?]", "message[votes_up]"

      assert_select "input#message_votes_down[name=?]", "message[votes_down]"
    end
  end
end
