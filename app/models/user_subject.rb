class UserSubject < ActiveRecord::Base
  after_create :set_subject_activity

  belongs_to :subject
  belongs_to :user
  
  validates :user_id, presence: true
  validates :subject_id, presence: true

  private
  def set_subject_activity
    user.activities.create target_id: subject_id, state: Settings.learned
  end
end
