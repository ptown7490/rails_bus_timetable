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

private
  def line_params
    params.require(:line).permit(:number)
  end
end
