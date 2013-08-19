class SchoolSubject < ActiveRecord::Base
  attr_accessible :title

  has_many :evaluations
  has_and_belongs_to_many :study_groups
end
