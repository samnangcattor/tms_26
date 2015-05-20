class Subject < ActiveRecord::Base
  has_many :tasks, dependent: :destroy, inverse_of: :subject
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_subjects

  accepts_nested_attributes_for :tasks, allow_destroy: true
  accepts_nested_attributes_for :course_subjects

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :status, presence: true, length: {maximum: 10}
end
