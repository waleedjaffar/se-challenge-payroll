class TimeReport < ActiveRecord::Base
  validates_presence_of :report_id, :date, :hours_worked, :employee_id, :job_group
end
