require 'rails_helper'

RSpec.describe "job_groups/edit", type: :view do
  before(:each) do
    @job_group = assign(:job_group, JobGroup.create!(
      :name => "MyString",
      :hour_rate => 1
    ))
  end

  it "renders the edit job_group form" do
    render

    assert_select "form[action=?][method=?]", job_group_path(@job_group), "post" do

      assert_select "input#job_group_name[name=?]", "job_group[name]"

      assert_select "input#job_group_hour_rate[name=?]", "job_group[hour_rate]"
    end
  end
end
