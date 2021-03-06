class UsersController < ApplicationController

  before_action :set_user ,only: [:show,:edit,:update]


  def index
    @users = User.paginate(page: params[:page],per_page: 5)

  end




  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "welcome to Alpha Blog#{@user.username}"
      redirect_to user_path(@user)

    else
      render 'new'

    end
  end

  def edit 
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account is updated successfully"
      redirect_to articles_path

    else
      render 'edit'

    end

  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page],per_page: 2)

  end

  def user_params
    params.require(:user).permit(:username,:email,:password)

  end

  def set_user
    @user = User.find(params[:id])
  end
end