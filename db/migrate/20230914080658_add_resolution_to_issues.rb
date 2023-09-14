class AddResolutionToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :resolution, :text
  end
end
