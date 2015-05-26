class Supervisor < ActiveRecord::Migration
  def change
    rename_column :users, :is_supervisor, :supervisor
  end
end
