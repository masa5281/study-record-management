class CreateStudyRecordTags < ActiveRecord::Migration[7.2]
  def change
    create_table :study_record_tags do |t|
      t.references :study_record, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :study_record_tags, [ :study_record_id, :tag_id ], unique: true
  end
end
