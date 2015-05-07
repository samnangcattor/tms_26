class User < ActiveRecord::Base
  has_many :activies, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :subjects, through: :user_subjects
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks
end
