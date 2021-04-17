require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      calendar: nil,
      name: "MyText",
      duration: ""
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[calendar_id]"

      assert_select "textarea[name=?]", "event[name]"

      assert_select "input[name=?]", "event[duration]"
    end
  end
end
