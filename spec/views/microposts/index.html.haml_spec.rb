require 'rails_helper'

RSpec.describe "microposts/index", type: :view do
  before(:each) do
    assign(:microposts, [
      Micropost.create!(
        :content => "MyText",
        :user_id => 2
      ),
      Micropost.create!(
        :content => "MyText",
        :user_id => 2
      )
    ])
  end

  it "renders a list of microposts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
