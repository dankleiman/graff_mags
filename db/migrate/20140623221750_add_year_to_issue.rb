class AddYearToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :year, :integer
  end
end
