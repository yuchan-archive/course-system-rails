require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :title => "Title",
        :level => 1
      ),
      Course.create!(
        :title => "Title",
        :level => 1
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
