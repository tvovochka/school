class CreateStudyGroups < ActiveRecord::Migration
  def change
    create_table :study_groups do |t|
      t.string :title,   		null: false, limit: 100, default: ''
      t.integer :semestr,		null: false, limit: 2, default: 1
      t.text :characteristic,	limit: 2000

      t.timestamps
    end
    add_index :study_groups, :semestr
  end
end
