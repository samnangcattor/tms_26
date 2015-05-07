class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.references :user, index: true
      t.references :task, index: true
      t.integer :id_course
      t.string :status

      t.timestamps null: false
    end
    add_foreign_key :user_tasks, :users
    add_foreign_key :user_tasks, :tasks
  end
end
