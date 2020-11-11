class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @diaries = user.diaries
    @user = User.find(params[:id])
  end

end
