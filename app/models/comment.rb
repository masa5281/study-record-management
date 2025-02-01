class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :study_record

  validates :comment, presence: true
  validates :user, presence: true
end
