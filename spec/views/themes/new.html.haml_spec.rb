require 'rails_helper'

RSpec.describe "themes/new", type: :view do
  before(:each) do
    assign(:theme, Theme.new(
      :name => "MyString",
      :qty_items => 1
    ))
  end

  it "renders new theme form" do
    render

    assert_select "form[action=?][method=?]", themes_path, "post" do

      assert_select "input#theme_name[name=?]", "theme[name]"

      assert_select "input#theme_qty_items[name=?]", "theme[qty_items]"
    end
  end
end
