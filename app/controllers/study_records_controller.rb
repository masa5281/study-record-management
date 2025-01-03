class StudyRecordsController < ApplicationController
  before_action :set_current_user

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
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @study_record = StudyRecord.find(params[:id])
  end

  def edit
    @study_record = StudyRecord.find(params[:id])
  end

  def update
    @study_record = StudyRecord.find(params[:id])
    if @study_record.update(study_record_params)
      redirect_to study_record_path(@study_record)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @study_record = StudyRecord.find(params[:id])
    @study_record.destroy
    redirect_to study_records_path, status: :see_other
  end

  private
  def study_record_params
    params.require(:study_record).permit(:name, :content)
  end

  def set_current_user
    @user = current_user
  end
end
