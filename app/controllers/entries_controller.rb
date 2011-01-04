class EntriesController < ApplicationController
  before_filter :require_admin, :only => [:submissions, :approve, :destroy]
  
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
      flash[:notice] = 'Thanks for your lovely submission!'
      redirect_to Entry.random
    else
      render :new
    end
  end
  
  def submissions
    @entries = Entry.all(:conditions => {:approved => false}, :limit => 10)
  end
  
  def approve
    @entry = Entry.find(params[:id])
    @entry.approved = true
    @entry.save
    
    redirect_to submissions_entries_path
  end
  
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    
    redirect_to submissions_entries_path
  end
  
end
