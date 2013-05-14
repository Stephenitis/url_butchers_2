class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :token, :password_confirmation

  has_many :urls

  validates :password, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  before_save :generate_token

  def generate_token
    o =  [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
    self.token  =  (0...30).map{ o[rand(o.length)] }.join
  end

end
