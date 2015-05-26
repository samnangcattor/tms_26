class IsSupervisor < ActiveRecord::Migration
  def change
    rename_column :users, :issupervisor, :is_supervisor
  end
end
