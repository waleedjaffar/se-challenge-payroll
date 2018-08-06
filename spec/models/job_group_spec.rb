require 'rails_helper'

RSpec.describe JobGroup, type: :model do

  let(:job_groups) { JobGroup.all }

  it 'returns atleast two groups' do
    expect(job_groups.count).to be >= 2
  end
end
