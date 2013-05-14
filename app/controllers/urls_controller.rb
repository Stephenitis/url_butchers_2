class UrlsController < ApplicationController
  def index
  end

  def create
    @url = Url.new(params[:url])
    respond_to do |format|
      if @url.save
        format.html { redirect_to :root }
        format.js
      else
      end
    end
  end

  def new
  end

  def delete
  end

  def show
    @url = Url.where(shorturl: params[:shorturl]).first
    @url.add_count
    redirect_to "http://#{@url.originalurl}"
  end

end
