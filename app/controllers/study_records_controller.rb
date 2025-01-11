class StudyRecordsController < ApplicationController
  before_action :set_current_user
  before_action :set_study_record, only: %i[show edit update destroy]
  before_action :ensure_current_user, only: %i[edit update destroy]
  before_action :authenticate_user!, only: %i[new create show edit]

  def index
    @study_records = params[:tag_id].present? ? Tag.find(params[:tag_id]).study_records : StudyRecord.all
  end

  def new
    @study_record = StudyRecord.new
  end

  def create
    @study_record = StudyRecord.new(study_record_params)
    if @study_record.save
      redirect_to study_records_path, flash: { success: "学習記録の投稿に成功しました" }
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @study_record.update(study_record_params)
      redirect_to study_record_path(@study_record), flash: { success: "学習記録の編集に成功しました" }
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @study_record.destroy
    redirect_to study_records_path, status: :see_other, flash: { success: "学習記録の削除に成功しました" }
  end

  private
  def study_record_params
    params.require(:study_record).permit(:name, :content, :user_id, tag_ids: [])
  end

  def set_current_user
    @user = current_user
  end

  def set_study_record
    @study_record = StudyRecord.find(params[:id])
  end

  def ensure_current_user
    user = @study_record.user
    unless current_user.id == user.id
      redirect_to study_records_path
    end
  end
end
