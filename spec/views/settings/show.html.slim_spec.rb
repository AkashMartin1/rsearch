require 'rails_helper'

RSpec.describe "settings/show", type: :view do
  before(:each) do
    @setting = assign(:setting, Setting.create!(
      :index => "Index",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/Status/)
  end
end
