class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
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


private
  def question_params
   params.require(:question).permit(:title, :content) #user_id
  end
end
