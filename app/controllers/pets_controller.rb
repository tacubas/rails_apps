class PetsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @pet = @user.pets.new
  end

  def create
    @user = User.find(params[:user_id])
    @pet = @user.pets.new(pet_params)
    if @pet.valid?
      @pet.save
      redirect_to customers_path, notice: 'Pet added'
    else
      render action: :new
    end
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :pet_type, :breed, :salt, :y_age, :m_age, :weight)
  end
end
