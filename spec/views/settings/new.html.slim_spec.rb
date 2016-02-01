require 'rails_helper'

RSpec.describe "settings/new", type: :view do
  before(:each) do
    assign(:setting, Setting.new(
      :index => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new setting form" do
    render

    assert_select "form[action=?][method=?]", settings_path, "post" do

      assert_select "input#setting_index[name=?]", "setting[index]"

      assert_select "input#setting_status[name=?]", "setting[status]"
    end
  end
end
