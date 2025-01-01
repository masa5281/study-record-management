class AddUserIdToStudyRecords < ActiveRecord::Migration[7.2]
  def change
    add_reference :study_records, :user, foreign_key: true
  end
end
