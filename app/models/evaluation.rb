class Evaluation < ActiveRecord::Base
  attr_accessible :student_id, :school_subject_id, :value 

  belongs_to :student
  belongs_to :school_subject
end
