class CreateMagazines < ActiveRecord::Migration
  class Magazine < ActiveRecord::Base; end
  class Issue < ActiveRecord::Base; end

  def up
    create_table :magazines do |t|
      t.string :title
      t.string :alternate_titles
    end

    add_column :issues, :magazine_id, :integer

    ActiveRecord::Base.transaction do
      Issue.all.each do |issue|
        magazine = Magazine.find_by(title: issue.magazine)
        if magazine.nil?
          magazine = Magazine.create!(title: issue.magazine)
        end

        issue.magazine_id = magazine.id
        issue.save!
      end
    end
  end

  def down
    remove_column :issues, :magazine_id, :integer
    drop_table :magazines
  end
end
