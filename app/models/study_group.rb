class StudyGroup < ActiveRecord::Base
  attr_accessible :title, :semestr, :characteristic

  has_many :students
  has_and_belongs_to_many :school_subjects
end
