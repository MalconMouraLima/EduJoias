class JewelsController < ApplicationController
  before_action :find_jewel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    if params[:category].blank?
      @jewels = Jewel.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @jewels = Jewel.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
    if @jewel.reviews.blank?
      @average_review = 0
    else
      @average_review = @jewel.reviews.average(:rating).round(2)
    end
  end

  def new
    @jewel = current_user.jewels.build
    # para o option_for_select é necessario um array
    # onde é passado o nome e o id
    @categories = Category.all.map { |c| [c.name, c.id]  }
  end

  def create
    @jewel = current_user.jewels.build(jewel_params)
    @jewel.category_id = params[:category_id]
    if @jewel.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map { |c| [c.name, c.id]  }
  end

  def update
    @jewel.category_id = params[:category_id]
    if @jewel.update(jewel_params)
      redirect_to jewel_path(@jewel)
    else
      render 'edit'
    end
  end

  def destroy
    @jewel.destroy
		redirect_to root_path
  end

  private

  def jewel_params
    params.require(:jewel).permit(:title, :description, :category_id, :jewel_img)
  end

  def find_jewel
		@jewel = Jewel.find(params[:id])
	end

end
