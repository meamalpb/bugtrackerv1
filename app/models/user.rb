class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :moderator , :tester , :developer , :projectLead , :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
  has_and_belongs_to_many :projects
  has_many :assigned_issues, class_name: 'Issue', foreign_key: 'assigned_id'
  has_many :assignee_issues, class_name: 'Issue', foreign_key: 'assignee_id'

end
