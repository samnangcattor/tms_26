class UserSubject < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  
  validates :user_id, presence: true
  validates :subject_id, presence: true
end
