class AnswersController < ApplicationController
  respond_to :html, :js
  def index
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    respond_to do |format|
      format.html {  render :new }
      format.js
    end
  end

  def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.new(answer_params)

		if @answer.save
      flash[:notice] = "Comment added!"
        respond_to do |format|
          format.html {  redirect_to question_path(@question) }
          format.js
        end
		else
      flash[:alert] = "Sorry! Try again"
			render 'new'
		end

	end

  def show
    @answer = Answer.find(params[:id])
  end

  def destroy

    @answer = Answer.find(params[:id])
    @question = @answer.question
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
