class LinesController < ApplicationController

  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
    render 'new'
  end

  def create
    @line = Line.create(line_params)
    if @line.save
      flash[:notice] = 'Line created'
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = 'Line deleted.'
    redirect_to lines_path
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      flash[:notice] = 'Line updated.'
      redirect_to lines_path
    else
      render 'edit'
    end
  end

private
  def line_params
    params.require(:line).permit(:number)
  end
end
