class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|
      t.references :course, index: true
      t.references :subject, index: true

      t.timestamps null: false
    end
    add_foreign_key :course_subjects, :courses
    add_foreign_key :course_subjects, :subjects
  end
end
