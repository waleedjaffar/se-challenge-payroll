require 'rails_helper'

RSpec.describe "job_groups/show", type: :view do
  before(:each) do
    @job_group = assign(:job_group, JobGroup.create!(
      :name => "Name",
      :hour_rate => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
