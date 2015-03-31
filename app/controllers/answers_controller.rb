class AnswersController < ApplicationController
  respond_to :html, :js
  def index
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create(answer_params)
		@answer.question_id == current_user.id

		if @answer.save
      flash[:notice] = "Comment added!"
			redirect_to question_path(@question)
		else
      flash[:alert] = "Sorry! Try again"
			render 'new'
		end

      respond_to do |format|
       format.html {  render question_path(@question) }
       format.json
    end
	end

  def show
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)

  end


  private

  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end



  # def edit
	# 	@question = Question.find(params[:question_id])
	# 	@answer = @question.answers.find(params[:id])
	# end
  #
	# def update
  #   @question = Question.find(params[:question_id])
  #   @answer = @question.answers.find(params[:id])
  #
	# 	if @answer.update(params[:answer].permit(:answer))
	# 		redirect_to question_path(@question)
	# 	else
	# 		render 'edit'
	# 	end
	# end

	# def destroy
  #   @question = Question.find(params[:question_id])
  #   @answer = @question.answers.find(params[:id])
	# 	@answer.destroy
	# 	redirect_to question_path(@question)
	# end
end
