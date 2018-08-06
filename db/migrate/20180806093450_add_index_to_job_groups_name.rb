class AddIndexToJobGroupsName < ActiveRecord::Migration
  def change
    add_index( :job_groups, :name, unique: true )
  end
end
