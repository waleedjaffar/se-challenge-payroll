class ChangeHoursWorkedToFloat < ActiveRecord::Migration
  def change
    change_column :time_reports, :hours_worked, :float
  end
end
