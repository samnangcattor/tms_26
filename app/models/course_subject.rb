class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  
  validates :course_id, presence: true
  validates :subject_id, presence: true
end
