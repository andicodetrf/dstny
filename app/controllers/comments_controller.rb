class CommentsController < ApplicationController
  def index
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = Comment.new(comment_params)
    @comment["question_id"] = @question.id
    @comment["user_id"] = current_user.id

    if @comment.save
      flash[:notice] = "Comment Created!"
      redirect_to question_path(@question.id)
    else
      flash[:alert] = "Comment Not Created!"
      redirect_to question_path(@question.id)
    end
  end

  def new
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    # respond_to do |format|
    #   format.js
>>>>>>> included edit button
    if @comment.update(comment_params)
      flash[:notice] = "Comment Edited!"
      redirect_to question_path(@question.id)
    else
      flash[:alert] = "Comment Not Edited!"
      redirect_to question_path(@question.id)
=======
    respond_to do |format|
      format.js
=======
    # respond_to do |format|
    #   format.js
>>>>>>> included edit button
    if @comment.update(comment_params)
        flash[:notice] = "Comment Edited!"
        redirect_to question_path(@question.id)
    else 
        flash[:alert] = "Comment Not Edited!"
        redirect_to question_path(@question.id)
>>>>>>> added edit button
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id]).destroy
    redirect_to question_path(@question.id)
  end

  def edit
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
  end

  def show
  end
  private
  def comment_params
    params.require(:comment).permit(:user_id, :comment_text, :post_id, comment_images: [])
  end
end
