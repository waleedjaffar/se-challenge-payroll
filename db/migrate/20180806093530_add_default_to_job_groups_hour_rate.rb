class AddDefaultToJobGroupsHourRate < ActiveRecord::Migration
  def change
    change_column_default( :job_groups, :hour_rate, 0 )
  end
end
