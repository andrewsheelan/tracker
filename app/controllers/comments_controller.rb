class CommentsController < ApplicationController
  def new
  end

  def create
    @user = User.find params[:user_id]

    comment = Comments.create(user_params)
    @user.comments >> comment
  end

  def index
    @comments = Comments.find_by_user(params[:user_id])

    respond_to do |format|
      format.xml  { render xml: @comments }
      format.json  { render json: @comments }
    end
  end
end