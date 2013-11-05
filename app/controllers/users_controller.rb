class UsersController < ApplicationController
  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      marker.lat user.latitude
      marker.lng user.longitude
      marker.picture({
        url: gravatar_url,
        width:80,
        height:80
      })
      marker.infowindow user.status
    end
  end

  def show
    @user = User.find(params[:id]) rescue User.new
  end


  def edit
    @user = User.find(params[:id])
  end

  
  def update
    user = User.find(params[:id])
    user.update_attribute("status", params['user']['status'])

    redirect_to :users
  end

  def new
    @user=User.new
  end

  def create
    User.create(params["user"])
  end
end
