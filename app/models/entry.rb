class Entry < ActiveRecord::Base
  
  validates_presence_of :source_url, :if => Proc.new { |thing| thing.image.blank? } 
  validates_presence_of :image, :if => Proc.new { |thing| thing.source_url.blank? }  
  
  has_many :votes
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def self.random
    self.find(:first, :order => 'random()', :conditions => {:approved => true})
  end
  
  def url(size = :medium)
    source_url || image.url(size)
  end
  
  def votes_count
    votes.count
  end
  
  def hipster_percentage
    ((votes.sum(:score).to_f / (votes_count.to_f * 10)) * 100).to_i
  end
  
end