json.extract! job_group, :id, :name, :hour_rate, :created_at, :updated_at
json.url job_group_url(job_group, format: :json)
