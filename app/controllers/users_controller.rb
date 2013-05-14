class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :root
    else
      render action: "new", :controller => "users"
    end
  end

  def signout
    session.clear
    redirect_to :root, :notice => "bye bye"
  end

  def login
    user = User.find_by_email(params[:user]["email"])
    if user && user.authenticate(params[:user]["password"])
      session[:token] = user.token
      redirect_to :root, :notice => "Welcome back, #{user.email}"
      p session
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end

  end

  def show
  end
end
