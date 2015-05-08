class Task < ActiveRecord::Base
  belongs_to :subject
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks

  validates :name, presence: true, length: {maximum: 50}
  validates :status, presence: true, length: {maximum: 10}
  validates :description, presence: true, length: {maximum: 500}
  validates :subject_id, presence: true
end
