class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id]) rescue User.new
  end
end
