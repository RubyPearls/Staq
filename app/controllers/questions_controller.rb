class QuestionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @questions = Question.all
    @answers = Answer.all
  end

  def new
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:notice] = "Question added successfully"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem"
      redirect_to :back
    end

  #   respond_to do |format|
  #    format.html {  redirect_to root_path }
  #    format.json
  #  end
  end

  def show
    @question = Question.find(params[:id])
  end


private
  def question_params
   params.require(:question).permit(:title, :content) #user_id
  end
end
