class EntriesController < ApplicationController

	def index
		# @entries = Entry.where( target_date: Date.today )
		@entries = all
	end

	def show
		date = Date.today

		@entry = Entry.find(params[:id])
	end

	def new

	end

	def edit 
		@entry = resource
	end

	def create	
		@entry = Entry.new(entry_params)
		@entry.target_date = @entry.target_date || Date.today
		
		if @entry.todo != ''
			@entry.save
		end
		# render action: "index"
		redirect_to :action => 'index'
	end

	def destroy
		@entry = Entry.find(params[:id])
		# Entry.destroy(params[:id])
		@entry.destroy

		redirect_to :action => 'index'
	end

	def toggle_completed

	  # if completed?
	  #   update_attribute(:completed_at, nil)
	  # else
	  #   update_attribute(:completed_at, Time.now)
	  # end

	  @entry = Entry.find(params[:id])

	  @entry.toggle!(:completed)

	  @entries = all

	  redirect_to :action => 'index'

	end

	def update
		# resource.update(entry_params)
		# redirect_to :action => 'index'

		@entry = Entry.find(params[:id])
		# @entry.toggle! :completed

		@entries = all

		render action: "index"

		# if @entry.update_attribute(:completed, true)
		# 	redirect_to entries_path, :notice => "Your To-Do item was marked as done!"
		# else
		# 	redirect_to entries_path, :notice => "Your To-Do item was unable to be marked as done!"
		# end

	end

	private 

		def all
			Entry.all
		end

		def resource
		  Entry.find(params[:id])
		end

		def entry_params
			params.require(:entry).permit(:todo, :completed, :target_date)
		end

end
