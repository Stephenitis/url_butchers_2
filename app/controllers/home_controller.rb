class HomeController < ApplicationController
  def index
    @user = User.new
    @url = Url.new
    @urls = Url.all
  end
end
