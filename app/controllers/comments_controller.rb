class CommentsController < ApplicationController
  def new
  end

  def create
    @user = User.find params[:user_id]

    comment = Message.new(message: params[:message])
    @user.messages >> comment
    @user.save
  end

  def index
    @comments = Message.where(user_id: params[:user_id])

    respond_to do |format|
      format.xml  { render xml: @comments }
      format.json  { render json: @comments }
    end
  end
end
