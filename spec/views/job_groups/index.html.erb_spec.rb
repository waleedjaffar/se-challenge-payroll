require 'rails_helper'

RSpec.describe "job_groups/index", type: :view do
  before(:each) do
    assign(:job_groups, [
      JobGroup.create!(
        :name => "Name",
        :hour_rate => 2
      ),
      JobGroup.create!(
        :name => "Name",
        :hour_rate => 2
      )
    ])
  end

  it "renders a list of job_groups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
