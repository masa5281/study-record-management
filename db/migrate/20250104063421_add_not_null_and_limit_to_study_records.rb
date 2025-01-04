class AddNotNullAndLimitToStudyRecords < ActiveRecord::Migration[7.2]
  def change
    change_column :study_records, :name, :string, null: false
    change_column :study_records, :content, :text, null: false, limit: 200
  end
end
