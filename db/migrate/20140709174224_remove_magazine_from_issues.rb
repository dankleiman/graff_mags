class RemoveMagazineFromIssues < ActiveRecord::Migration
  class Magazine < ActiveRecord::Base; end
  class Issue < ActiveRecord::Base; end

  def up
   remove_column :issues, :magazine, :string
  end

  def down
    add_column :issues, :magazine, :string
    # Go through magazine table, find issues with that magazine id and update title field for that magazine
    ActiveRecord::Base.transaction do
      Magazine.all.each do |magazine|
        issues = Issue.where(magazine_id: magazine.id)
        issues.each do |issue|
          issue.magazine = magazine.title
          issue.save!
        end
      end
    end
  end
end
