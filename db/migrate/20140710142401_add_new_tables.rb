class AddNewTables < ActiveRecord::Migration
  def change
    remove_column :issues, :language, :string
    create_table :languages do |t|
      t.string :language
    end
    add_column :issues, :language_id, :integer

    remove_column :issues, :size, :string
    create_table :sizes do |t|
      t.string :size
    end
    add_column :issues, :size_id, :integer

    remove_column :issues, :binding, :string
    create_table :stitchings do |t|
      t.string :binding
    end
    add_column :issues, :stitching_id, :integer

    remove_column :issues, :format, :string
    create_table :formats do |t|
      t.string :format
    end
    add_column :issues, :format_id, :integer

    remove_column :issues, :medium, :string
    create_table :media do |t|
      t.string :medium
    end
    add_column :issues, :medium_id, :integer

    create_table :crews do |t|
      t.string :crew
    end
    add_column :issues, :crew_id, :integer
  end
end
