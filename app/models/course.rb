class Course < ActiveRecord::Base
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects

  accepts_nested_attributes_for :course_subjects

  validates :name,  presence: true, length: {maximum: 50}
  validates :description,  presence: true, length: {maximum: 500}
  validates :status, presence: true, length: {maximum: 10}
end
