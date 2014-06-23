class AddImgToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :cover_image, :string
  end
end
