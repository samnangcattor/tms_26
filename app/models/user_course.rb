class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  
  validates :user_id, presence: true
  validates :course_id, presence: true

  scope :users_in_course, ->(user_id, course_id){where user_id: user_id,
    course_id: course_id}
end
