class VotesController < ApplicationController
  
  def create
    
    @vote = Vote.create(params[:vote])
    @vote.entry_id = params[:entry_id]
    @vote.voter_ip = request.ip
    @vote.save
    
    flash[:vote] = @vote.id
    
    redirect_to Entry.random
  end
  
end