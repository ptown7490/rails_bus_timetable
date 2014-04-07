class StationsController < ApplicationController

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
    render 'new'
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = 'Station created.'
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = 'Station deleted.'
    redirect_to stations_path
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      flash[:notice] = 'Station updated.'
      redirect_to stations_path
    else
      render 'edit'
    end
  end

private
  def station_params
    params.require(:station).permit(:number)
  end

end
