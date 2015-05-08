class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_courses, :users
    add_foreign_key :user_courses, :courses
  end
end
