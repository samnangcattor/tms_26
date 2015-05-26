class ChangeIssupervisorColumn < ActiveRecord::Migration
  def change
  	rename_column :users, :isSupervisor, :issupervisor
  end
end
