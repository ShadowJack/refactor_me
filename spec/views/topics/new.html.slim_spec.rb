require 'rails_helper'

RSpec.describe "topics/new", :type => :view do
  before(:each) do
    assign(:topic, Topic.new(
      :title => "MyString",
      :first_comment => ""
    ))
  end

  it "renders new topic form" do
    render

    assert_select "form[action=?][method=?]", topics_path, "post" do

      assert_select "input#topic_title[name=?]", "topic[title]"

      assert_select "input#topic_first_comment[name=?]", "topic[first_comment]"
    end
  end
end