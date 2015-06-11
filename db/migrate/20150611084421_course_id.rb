class CourseId < ActiveRecord::Migration
  def change
    rename_column :user_tasks, :id_course, :course_id
  end
end
