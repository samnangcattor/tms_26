class CreateUserSubjects < ActiveRecord::Migration
  def change
    create_table :user_subjects do |t|
      t.references :user, index: true
      t.references :subject, index: true
      t.string :status

      t.timestamps null: false
    end
    add_foreign_key :user_subjects, :users
    add_foreign_key :user_subjects, :subjects
  end
end
