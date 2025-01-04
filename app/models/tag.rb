class Tag < ApplicationRecord
  has_many :study_record_tags, dependent: :destroy
  has_many :study_records, through: :study_record_tags
end
