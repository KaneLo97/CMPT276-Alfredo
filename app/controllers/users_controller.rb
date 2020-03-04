class UsersController < ApplicationController
  before_action :user_logged_in, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  def index
    @users = User.paginate(page: params[:page])
  end
  def new
    @user = User.new
  end
  def create
    repeated = User.find_by(username: params[:user][:username])
    if repeated
      flash[:danger] = "Username Already Exists"
      render 'new'
    else
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to Alfredo! :)"
        redirect_to @user
      else
        render 'new'
      end
    end
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
   @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:fname, :lname, :username, :password, :email)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
