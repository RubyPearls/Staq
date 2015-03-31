class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

end
