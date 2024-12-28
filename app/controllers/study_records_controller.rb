class StudyRecordsController < ApplicationController
  def index
    @study_records = StudyRecord.all
  end

  def new
    @study_record = StudyRecord.new
  end

  def create
    @study_record = StudyRecord.new(study_record_params)
    if @study_record.save
      redirect_to study_records_path
    else
      render "new"
    end
  end

  private
  def study_record_params
    params.require(:study_record).permit(:name, :content)
  end
end
