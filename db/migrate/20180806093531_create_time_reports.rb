class CreateTimeReports < ActiveRecord::Migration
  def change
    create_table :time_reports do |t|
      t.integer :report_id
      t.date :date
      t.integer :hours_worked
      t.integer :employee_id
      t.string :job_group

      t.timestamps null: false
    end
  end
end
