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

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @users }
      format.json  { render json: @users }
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
    user.update_attribute("latitude", params['user']['latitude'])
    user.update_attribute("longitude", params['user']['longitude'])

    redirect_to :users
  end

  def new
    @user=User.new
  end

  def create
    User.create(user_params)
    redirect_to "/users"
  end

  def login
    login=params["login"]
    if(login)
      user = User.find_by_email(login["email"].downcase)
      if(user && user.authenticate(login["password"]))
        session[:user] = user.id
        redirect_to "/users/#{user.id}/edit"
      end
    end
    
  end

  def logout
    reset_session
    redirect_to "/users"
  end  

  def status
    user=User.find(session[:user])
   redirect_to "/users/#{user.id}/edit"
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :status,:latitude, :longitude)
  end
end
