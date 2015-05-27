class Course < ActiveRecord::Base
  after_update :set_course_activity

  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :status, presence: true, length: {maximum: 10}

  private 
  def set_course_activity
    users.each {|user| user.activities.create target_id: id, state: "Joined"}
  end
end
