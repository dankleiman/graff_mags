class AddIssueNumberToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :issue_number, :integer
  end
end
