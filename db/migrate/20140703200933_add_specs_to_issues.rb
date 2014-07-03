class AddSpecsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :front_cover, :string
    add_column :issues, :back_cover, :string
    add_column :issues, :featured_image, :string
    add_column :issues, :language, :string
    add_column :issues, :size, :string
    add_column :issues, :binding, :string
    add_column :issues, :medium, :string
    add_column :issues, :format, :string
  end
end
