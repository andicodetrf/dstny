class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]

  before_action :set_question, only: [:show, :edit, :destroy, :update]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.options.build
    @question.build_category
  end

  def create
    @question = Question.new(question_params)
    @question["user_id"] = current_user.id

    category = @question.category.cat_type

    # if category is found in category database
    if Category.find_by(cat_type: category) != nil
      #assign the available category to the question
      @question.category = Category.find_by(cat_type: category)
      if @question.save
        redirect_to question_path(@question.id)
      else
        render :new
      end
    else
      if @question.save
        redirect_to question_path(@question.id)
      else
        render :new
      end
    end
  end


  def show

    @comment = Comment.new()
    # @comment.images.attach(params[:comment][:comment_images])
    @question = Question.find(params[:id])
    @options = @question.options

    if user_signed_in?
      @comment["user_id"] = current_user.id
    end
      @category = @question.category
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def flag
    puts "@@@@@@@@@@@@@@@@@"
    puts params[:question_id]
    puts "@@@@@@@@@@@@@@@@@"

    @question = Question.find(params[:question_id])
    # puts @question
    UserMailer.flag_question_email(@question, current_user).deliver_now
    flash[:notice] = "Thank you for reporting. Admin has been informed"
    redirect_to question_path(@question.id)
  end

  def toggle
    puts "@@@@@@@@@@@@@@@@@"
    puts params[:question_id]
    puts "@@@@@@@@@@@@@@@@@"

    @question = Question.find(params[:question_id])
    @question.status = !@question.status

    if @question.save
      redirect_to question_path(@question.id)
    else
      flash[:warning] = "Please try again."
      redirect_to question_path(@question.id)
    end
  end

  private

  def question_params
    params.require(:question).permit(:question_text, :description, :user_id, :comment_text, :expiry_date, options_attributes: [:option_text], question_images: [], category_attributes: [:id, :cat_type])
<<<<<<< HEAD
=======
    params.require(:question).permit(:question_text, :description, :user_id, :comment_text, :expiry_date, question_images: [], comment_images: [],options_attributes: [:option_text])
>>>>>>> add images to comments
=======
>>>>>>> added pics
  end

  def set_question
    @question = Question.find(params[:id])
  end

  #INCORPORATED ABOVE INTO QUES_PARAMS
  # def question_params
  #   params.require(:question).permit(:user_id, :comment_text)
  # end
end
