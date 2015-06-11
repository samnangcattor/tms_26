class Course < ActiveRecord::Base
  after_update :set_course_activity
  after_update :set_subject_user

  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :status, presence: true, length: {maximum: 10}

  scope :current_course, ->{where status: Settings.start}

  private 
  def set_course_activity
    users.each {|user| user.activities.create target_id: id, state: Settings.joined}
  end

  def set_subject_user 
    subjects.each do |subject|
      users.each do |user|
        user_subjects = user.user_subjects
        unless user_subjects.where(user_id: user.id, subject_id: subject.id, course_id: id).exists? 
          user.user_subjects.create user_id: user.id, subject_id: subject.id,
            status: Settings.start, course_id: id
        end
      end
    end    
  end
end
