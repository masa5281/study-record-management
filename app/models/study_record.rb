class StudyRecord < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :study_record_tags
  has_many :study_record_tags

  validates :name, presence: true
  validates :content, presence: true
end
