class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @questions = Question.all
    @question = Question.new
  end


end
