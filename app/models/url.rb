class Url < ActiveRecord::Base
  belongs_to :user
  attr_accessible :counter, :originalurl, :shorturl

  before_save :url_cleanser
  before_create :url_shortener
  validates :originalurl, :format => {:with => URI::regexp(%w(http https))}, :on => :create


  def add_count
    self.counter += 1
    self.save
  end

  private

  def url_shortener
    update = {}
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    self.shorturl  =  (0...4).map{ o[rand(o.length)] }.join
    self
  end

  def url_cleanser
    self.originalurl = self.originalurl.gsub(/.*:\/\//, '')
  end
end
