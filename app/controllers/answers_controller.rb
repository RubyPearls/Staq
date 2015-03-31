class AnswersController < ApplicationController


  def index
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create(params[:answer].permit(:answer))
		@answer.question_id = current_user.id if current_user

		if @answer.save
			redirect_to question_path(@question)
		else
			render 'new'
		end
	end

  def show
    @answer = Answer.find(params[:id])
  end

  #
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
