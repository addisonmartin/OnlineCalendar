require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      calendar: nil,
      name: "MyText",
      duration: ""
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[calendar_id]"

      assert_select "textarea[name=?]", "event[name]"

      assert_select "input[name=?]", "event[duration]"
    end
  end
end
