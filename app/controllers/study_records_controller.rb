class StudyRecordsController < ApplicationController
  def index
  end

  def new
    @study_record = StudyRecord.new
  end

  def create
    @study_record = StudyRecord.new(study_record_params)
    @study_record.save
    redirect_to study_records_path
  end

  private
  def study_record_params
    params.require(:study_record).permit(:name, :content)
  end
end
