class ReviewsController < ApplicationController
  before_action :find_jewel
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.jewel_id = @jewel.id
    @review.user_id = current_user.id

    if @review.comment.blank?
      render 'new'
    else
      if @review.save
        redirect_to jewel_path(@jewel)
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def update
		if @review.update(review_params)
			redirect_to jewel_path(@jewel)
		else
			render 'edit'
		end
	end

  def destroy
		@review.destroy
		redirect_to jewel_path(@jewel)
	end

  private

  def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_jewel
			@jewel = Jewel.find(params[:jewel_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end
end
