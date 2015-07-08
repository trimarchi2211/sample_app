class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  
  def show
    @pin = Pin.find(params[:id])
  end

 
  def new
    @pin = Pin.new
  end

  
  def edit
    @pin = Pin.find(params[:id])
  end

  
  def create
    @pin = Pin.new(params[:pin])
      if @pin.save
          redirect_to @pin, notice: 'Pin was successfully created.'
      else
         render action: "new"
      end
  end

 
  def update
    @pin = Pin.find(params[:id])
      if @pin.update_attributes(params[:pin])
          redirect_to @pin, notice: 'Pin was successfully updated.'
      else
        render action: "edit"
      end    
  end

  
  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
      redirect_to pins_url
    end
end
