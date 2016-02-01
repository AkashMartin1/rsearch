require 'rails_helper'

RSpec.describe "settings/index", type: :view do
  before(:each) do
    assign(:settings, [
      Setting.create!(
        :index => "Index",
        :status => "Status"
      ),
      Setting.create!(
        :index => "Index",
        :status => "Status"
      )
    ])
  end

  it "renders a list of settings" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
