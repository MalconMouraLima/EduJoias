class JewelsController < ApplicationController
  before_action :find_jewel, only: [:show, :edit, :update, :destroy]

  def index
    @jewels = Jewel.all.order("created_at DESC")
  end

  def show
  end

  def new
    @jewel = Jewel.new
  end

  def create
    @jewel = Jewel.new(jewel_params)

    if @jewel.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @jewel.destroy
		redirect_to root_path
  end

  private

  def jewel_params
    params.require(:jewel).permit(:title, :description)
  end

  def find_jewel
			@jewel = Jewel.find(params[:id])
		end

end
