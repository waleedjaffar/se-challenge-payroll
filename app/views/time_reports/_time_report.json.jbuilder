json.extract! time_report, :id, :report_id, :date, :hours_worked, :employee_id, :job_group, :created_at, :updated_at
json.url time_report_url(time_report, format: :json)
