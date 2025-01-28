class CommentsController < ApplicationController
  def create
    study_record = StudyRecord.find(params[:study_record_id])
    comment = Comment.new(comment_params)
    comment.study_record_id = study_record.id
    comment.user_id = current_user.id
    comment.save
    redirect_to study_record_path(study_record)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
