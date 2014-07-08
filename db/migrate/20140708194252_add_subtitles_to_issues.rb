class AddSubtitlesToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :subtitle, :string
  end
end
