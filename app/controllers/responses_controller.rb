class ResponsesController < ApplicationController
  def index
    @resposes = Response.all
    render :index
  end

  def new
    @question = Question.find(params[:question_id])
    @respose = @question.resposes.new
    render :new
  end

  def create
    @question = Question.find(params[:question_id])
    @respose = @question.resposes.new(respose_params)
    if @respose.save
      flash[:notice] = "Response successfully added!"
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @respose = Response.find(params[:id])
    flash[:notice] = "Response successfully edited!"
    render :edit
  end

  def show
    @respose = Response.find(params[:id])
    render :show
  end

  def update
    @respose = Response.find(params[:id])
    if @respose.update(respose_params)
      flash[:notice] = "Response successfully updated!"
      redirect_to question_path(@respose.question)
    else
      render :edit
    end
  end

  def destroy
    @respose = Response.find(params[:id])
    @respose.destroy
    flash[:notice] = "Response successfully destroyed!"
    redirect_to question_path(@respose.question)
  end

  def show
    @question = Question.find(params[:question_id])
    @respose = Response.find(params[:id])
    render :show
  end

  private
    def respose_params
      params.require(:respose).permit(:user_id, :question_id, :text_body, :upvotes)
    end

end
