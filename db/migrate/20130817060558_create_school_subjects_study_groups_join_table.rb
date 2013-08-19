class CreateSchoolSubjectsStudyGroupsJoinTable < ActiveRecord::Migration
  def change
    create_table :school_subjects_study_groups, id: false do |t|
      t.integer :school_subject_id, null: false
      t.integer :study_group_id, null: false
    end
    add_index :school_subjects_study_groups, :school_subject_id
    add_index :school_subjects_study_groups, :study_group_id
    #add_index :school_subjects_study_groups, [:school_subject_id, :study_group_id]
  end
end
