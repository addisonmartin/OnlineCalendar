require 'rails_helper'

RSpec.describe "calendars/index", type: :view do
  before(:each) do
    assign(:calendars, [
      Calendar.create!(
        user: nil,
        name: "MyText"
      ),
      Calendar.create!(
        user: nil,
        name: "MyText"
      )
    ])
  end

  it "renders a list of calendars" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
