class StudyRecordTag < ApplicationRecord
  belongs_to :study_record
  belongs_to :tag
end
