class CreateStudyRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :study_records do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
