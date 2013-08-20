class Student < ActiveRecord::Base
  attr_accessible :name, :secondname, :email, :dob, :study_group_id, :ipreg, :average, :lock_version

  belongs_to :study_group
  has_many :evaluation

  validates :name,         presence: true, :length => { :maximum => 100 }
  validates :secondname,   presence: true, :length => { :maximum => 100 }
  validates :email,        presence: true, :length => { :maximum => 100 }
  validates :ipreg,        presence: true, :length => { :maximum => 100 }
  validates :dob,          presence: true
  validates :average,      presence: true, numericality: true
  validates_associated     :study_group
end
