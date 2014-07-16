class UpdateCountriesInIssues < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country
    end
    add_column :issues, :country_id, :integer
  end
end
