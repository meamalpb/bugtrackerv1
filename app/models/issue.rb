class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :assigned, class_name: 'User', optional: true
end
