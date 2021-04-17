require 'rails_helper'

RSpec.describe "calendars/new", type: :view do
  before(:each) do
    assign(:calendar, Calendar.new(
      user: nil,
      name: "MyText"
    ))
  end

  it "renders new calendar form" do
    render

    assert_select "form[action=?][method=?]", calendars_path, "post" do

      assert_select "input[name=?]", "calendar[user_id]"

      assert_select "textarea[name=?]", "calendar[name]"
    end
  end
end
