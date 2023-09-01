class Issue < ApplicationRecord
  belongs_to :project , dependent: :destroy 
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :assigned, class_name: 'User', optional: true
  has_many :comments
  after_update :createNotification
  after_create :createNotification
  private
  def createNotification
    Notification.create(issue_id: id, user_id: assigned_id , read: false)
    Notification.create(issue_id: id, user_id: assignee_id , read: false)
  end
end
