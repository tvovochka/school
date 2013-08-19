class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :student_id,		null: false
      t.integer :school_subject_id, null: false
      t.integer :value,				null: false, limit: 1

      t.timestamps
    end
    add_index :evaluations, :student_id
    add_index :evaluations, :school_subject_id
  end
end
