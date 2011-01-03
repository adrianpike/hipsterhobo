class Vote < ActiveRecord::Base
  
  belongs_to :entry
  
  def humanized_score
    score==0 ? 'Hobo' : 'Hipster'
  end
  
end
