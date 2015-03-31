class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
    @answers = @user.answers
  end
end
