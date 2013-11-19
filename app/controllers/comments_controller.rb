class CommentsController < ApplicationController
  def new
  end

  def create
    @user = User.find params[:user_id]

    comment = Message.create(user_params)
    @user.messages >> comment
  end

  def index
    @comments = Message.find_by_user_id(params[:user_id])

    respond_to do |format|
      format.xml  { render xml: @comments }
      format.json  { render json: @comments }
    end
  end
end
