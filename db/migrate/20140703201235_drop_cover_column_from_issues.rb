class DropCoverColumnFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :cover
  end
end
