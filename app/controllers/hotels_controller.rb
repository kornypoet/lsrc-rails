class HotelsController < ApplicationController

  before_filter :load_hotel, except: [:new, :index, :create]

  def index
    @hotels = Hotel.all
  end

  def show
    respond_to do |format|
      format.html
      format.xml{  render xml:  @hotel.to_xml  }
      format.json{ render json: @hotel.to_json }
    end    
  end

  def new
    @cities = City.order(:name).all
    @hotel  = Hotel.new
  end
  
  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save
      redirect_to @hotel
    else
      flash[:error] = @hotel.errors
      @cities = City.order(:name).all
      render :new
    end
  end

  def edit    
    @cities = City.order(:name)
  end

  def update
    if @hotel.update_attributes(params[:hotel])
      redirect_to @hotel
    else
      flash[:error] = @hotel.errors
      @cities = City.order(:name).all
      render :new      
    end

  end

private 

  def load_hotel
    @hotel = Hotel.find(params[:id])
  end

end
