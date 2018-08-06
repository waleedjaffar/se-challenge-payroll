class CreateJobGroups < ActiveRecord::Migration
  def change
    create_table :job_groups do |t|
      t.string :name
      t.integer :hour_rate

      t.timestamps null: false
    end
  end
end
