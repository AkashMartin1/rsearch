require 'rails_helper'

RSpec.describe "settings/edit", type: :view do
  before(:each) do
    @setting = assign(:setting, Setting.create!(
      :index => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit setting form" do
    render

    assert_select "form[action=?][method=?]", setting_path(@setting), "post" do

      assert_select "input#setting_index[name=?]", "setting[index]"

      assert_select "input#setting_status[name=?]", "setting[status]"
    end
  end
end
