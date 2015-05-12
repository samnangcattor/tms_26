class ChangeColumName < ActiveRecord::Migration
  def change
    rename_column :activities, :id_target, :target_id
    rename_column :activities, :details, :state
  end
end
