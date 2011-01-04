class Entry < ActiveRecord::Base
  
  validates_presence_of :source_url, :if => Proc.new { |thing| thing.image.blank? } 
  validates_presence_of :image, :if => Proc.new { |thing| thing.source_url.blank? }  
  
  has_many :votes
  has_attached_file :image, :styles => { :large => "480x640>", :thumb => "48x48#" }
  
  def self.random
    self.find(:first, :order => 'random()', :conditions => {:approved => true})
  end
  
  def url(size = :large)
    source_url || image.url(size)
  end
  
  def votes_count
    votes.count
  end
  
  def hipster_percentage
    ((votes.sum(:score).to_f / (votes_count.to_f * 10)) * 100).to_i
  end
  
end
