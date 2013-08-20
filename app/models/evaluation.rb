class Evaluation < ActiveRecord::Base
  attr_accessible :student_id, :school_subject_id, :value 

  belongs_to :student
  belongs_to :school_subject

  validates_associated     :student
  validates_associated     :school_subject
  validates :value,        presence: true, numericality: { only_integer: true }, :length => { :maximum => 1 }
end
