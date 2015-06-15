class UserTask < ActiveRecord::Base
  after_create :set_task_activity

  belongs_to :user
  belongs_to :task
  
  validates :user_id, presence: true
  validates :task_id, presence: true

  private
  def set_task_activity
    user.activities.create target_id: task_id, state: Settings.done
  end
end
