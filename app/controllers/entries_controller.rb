class EntriesController < ApplicationController
  
  def index
    redirect_to Entry.random
  end
  
  def show
    @entry = Entry.find(params[:id])
    @vote = Vote.new
  end
  
  def new
    @entry = Entry.new
  end
  
  def create
    @entry = Entry.new(params[:entry])
    if @entry.save then
      flash[:notice] = 'Thanks for your submission!'
      redirect_to Entry.random
    else
      render :new
    end
  end
  
end
