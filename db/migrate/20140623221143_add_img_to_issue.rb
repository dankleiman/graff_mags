class AddImgToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :cover, :string
  end
end
