class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render :index
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully posted!"
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    flash[:notice] = "Question successfully edited!"
    render :edit
  end

  def show
    @question = Question.find(params[:id])
    render :show
  end

  def update
    @question= Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully updated!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question successfully destroyed!"
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:user_id, :title, :text_body)
  end
end
