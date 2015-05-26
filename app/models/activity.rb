class Activity < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :target_id, presence: true
  validates :state, presence: true, length: {maximum: 50}

  scope :course_activities, ->(course_id){where target_id: course_id, state: "Joined"}
end
