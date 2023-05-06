class Project < ApplicationRecord
  has_many :issues, dependent: :destroy
  belongs_to :project_lead, class_name: 'User', foreign_key: 'project_lead_id'
  has_and_belongs_to_many :users
end
