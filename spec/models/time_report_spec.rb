require 'rails_helper'

RSpec.describe TimeReport, type: :model do

  let(:time_report) { TimeReport.new(report_id: 1, date: '02-08-2018', hours_worked: 3, employee_id: 1, job_group: 'A') }
  
  it 'report_id is mandatory' do
    time_report.report_id = nil
    time_report.valid?
    expect(time_report.errors[:report_id]).to eq (["can't be blank"])
  end
  
  it 'date is mandatory' do
    time_report.date = nil
    time_report.valid?
    expect(time_report.errors[:date]).to eq(["can't be blank"])
  end
  
  it 'hours_worked is mandatory' do
    time_report.hours_worked = nil
    time_report.valid?
    expect(time_report.errors[:hours_worked]).to eq(["can't be blank"])
  end
  
  it 'employee_id is mandatory' do
    time_report.employee_id = nil
    time_report.valid?
    expect(time_report.errors[:employee_id]).to eq(["can't be blank"])
  end
  
  it 'job_group is mandatory' do
    time_report.job_group = nil
    time_report.valid?
    expect(time_report.errors[:job_group]).to eq(["can't be blank"])
  end
  
  it 'record is saved successfully' do
    expect(time_report.save).to be true
  end
end
