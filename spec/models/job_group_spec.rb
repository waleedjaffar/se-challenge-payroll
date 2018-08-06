require 'rails_helper'

RSpec.describe JobGroup, type: :model do

  let(:job_groups) { JobGroup.all }

  it 'returns atleast two groups' do
    expect(job_groups.count).to be >= 2
  end

  it 'name is mandatory' do 
    job_group = JobGroup.new(name: nil, hour_rate: 40)
    job_group.valid?
    expect(job_group.errors[:name]).to eq (["can't be blank"])
  end

  it 'does not allow creation of duplicate group' do
    job_group = JobGroup.create(name: job_groups.first.name, hour_rate: job_groups.first.hour_rate)
    expect(job_group.errors[:name]).to eq(['has already been taken'])
  end

  it 'hour rate defaults to 0 if not available' do
    job_group = JobGroup.create(name: 'Test')
    expect(job_group.hour_rate).to eq 0
  end
end
