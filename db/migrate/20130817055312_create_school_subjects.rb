class CreateSchoolSubjects < ActiveRecord::Migration
  def change
    create_table :school_subjects do |t|
      t.string :title

      t.timestamps
    end
  end
end
