class CommentsController < ApplicationController
  def create
    @study_record = StudyRecord.find(params[:study_record_id])
    @comment = current_user.comments.new(comment_params)
    @comment.study_record = @study_record
    if @comment.save
      redirect_to study_record_path(@study_record)
    else
      render "study_records/show", status: :unprocessable_entity
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
      else
        format.turbo_stream
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to study_record_path(@comment.study_record), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
