class ChangeColumNameDetails < ActiveRecord::Migration
  def change
    rename_column :courses, :details, :description
    rename_column :subjects, :details, :description
    rename_column :tasks, :details, :description
    add_column :tasks, :status, :string
  end
end
