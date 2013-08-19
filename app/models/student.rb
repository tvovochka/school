class Student < ActiveRecord::Base
  attr_accessible :name, :secondname, :email, :dob, :study_group_id, :ipreg, :average, :lock_version

  belongs_to :study_group
  has_many :evaluation
end
