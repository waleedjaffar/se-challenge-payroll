require 'rails_helper'

RSpec.describe "job_groups/new", type: :view do
  before(:each) do
    assign(:job_group, JobGroup.new(
      :name => "MyString",
      :hour_rate => 1
    ))
  end

  it "renders new job_group form" do
    render

    assert_select "form[action=?][method=?]", job_groups_path, "post" do

      assert_select "input#job_group_name[name=?]", "job_group[name]"

      assert_select "input#job_group_hour_rate[name=?]", "job_group[hour_rate]"
    end
  end
end
