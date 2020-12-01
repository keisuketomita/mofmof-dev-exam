class PropertiesController < ApplicationController
  before_action :set_property, only: [:edit, :update, :destroy, :show]
  before_action :set_station_count, only: [:new, :edit, :show]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.stations.build }
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice:"新規投稿しました"
    else
      render :new
    end
  end

  def edit
    @property.stations.build
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "投稿を削除しました"
  end

  def show
    @stations = @property.stations
  end

  private
  def property_params
    params.require(:property).permit(
      :name, :price, :address, :age, :note,
      stations_attributes:[:route, :name, :minute, :id])
  end
  def set_property
     @property = Property.find(params[:id])
  end
  def set_station_count
    @station_count = 1
  end
end
