class AddStatusToIssue < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :status, :string
  end
end
