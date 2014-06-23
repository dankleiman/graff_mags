class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :magazine
      t.string :title, null: false
      t.string :address
      t.string :city
      t.string :state
      t.string :country
    end
  end
end
