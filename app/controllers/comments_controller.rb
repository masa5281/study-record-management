class CommentsController < ApplicationController
  def create
    @study_record = StudyRecord.find(params[:study_record_id])
    @comment = current_user.comments.new(comment_params)
    @comment.study_record = @study_record
    if @comment.save
      redirect_to study_record_path(study_record)
    else
      render "study_records/show", status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
