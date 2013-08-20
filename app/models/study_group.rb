class StudyGroup < ActiveRecord::Base
  attr_accessible :title, :semestr, :characteristic

  has_many :students
  has_and_belongs_to_many :school_subjects

  validates :title,           presence: true, :length => { :maximum => 100 }
  validates :characteristic,  :length => { :maximum => 2000 }
  validates :semestr,         presence: true, numericality: { only_integer: true }, :length => { :maximum => 2 }

end
