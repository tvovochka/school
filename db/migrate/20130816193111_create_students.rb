class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name,         null: false, limit: 100, default: ''
      t.string :secondname,   null: false, limit: 100, default: ''
      t.references :study_group
      t.date :dob,            null: false
      t.string :email,        null: true, limit: 100, default: ''
      t.string :ipreg,        null: false, limit: 100, default: ''
      t.float :average,       precision: 3, scale: 2, null: false

      t.timestamps
    end
    add_index :students, :study_group_id
    add_index :students, :secondname
    add_index :students, :average
    add_index :students, :ipreg
  end
end
