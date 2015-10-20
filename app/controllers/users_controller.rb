class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    #@users = User.all
    @users = User.all_except(current_user)
  end

  def show
    @user = User.find(params[:id])
    @pets = @user.pets
  end

  def doctors
    @users = User.doctors
  end

  def customers
    @users = User.customers
  end

  def new
    @user = User.new
  end

  def new_doctor
    @user = User.new
  end

  def new_customer
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path, notice: 'User created'
    else
      render action: :new_doctor
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User updated."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :address, :city, :state, :zip, :school, :years, :role_type, :password, :password_confirmation, :current_password)
  end
end
