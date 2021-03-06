class ReviewsController < ApplicationController
	before_action :find_play, only: [:new, :create, :edit, :update, :show, :destroy]

	def show
		@reviews = @play.reviews.all
	end

	def new
		
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.play_id = @play.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to @play
		else
			render 'new'
		end
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)
			redirect_to @play
		else
			render 'edit'
		end
	end

	def destroy
		@review = Review.find(params[:id])
		if @review.destroy
			redirect_to @play
		else
			render 'edit'
		end
	end

	private

	def find_play
		@play = Play.find(params[:play_id])
	end

	def review_params
		params.require(:review).permit(:rating, :comment)
	end
end
