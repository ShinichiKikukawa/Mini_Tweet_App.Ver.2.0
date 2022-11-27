class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      flash[:notice] = "ユーザーを新規作成しました！"
      redirect_to user_url @user
    else
      render :new
    end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email])
    @user.save
    redirect_to user_url @user
  end
end