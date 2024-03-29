class StoriesController < ApplicationController
	before_action :find_stories, only: [:show, :edit, :update, :destroy]
	def index
		@stories = Story.all.order("created_at DESC")
	end

	def choosegender
	end

	def show
	end

	def new 
		@story = Story.new
	end

	def create 
		@story = Story.new(story_params)
		if @story.save
			redirect_to @story
		else
			render 'new'
		end
	end
	
	def edit 
	end

	def update 
		if @story.update(story_params)
			redirect_to @story
		else
			render 'edit'
		end
	end

	def destroy
		@story.destroy
		redirect_to root_path
	end

	private
	def story_params 
		params.require(:story).permit(:gender, :name, :color, :activity, :success, :challenge, :friend_name, :friend_role, :challenge_mood, :action, :result, :result_mood, :eversince, :title)
	end

	def find_stories
		@story = Story.find(params[:id])
	end

end
