class EntriesController < ApplicationController

	def index
		# @entries = Entry.where( target_date: Date.today )
		# @entries = Entry.all.where(current_user.id)
		@entries = current_user.entries
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
		@entry.user_id = current_user.id
		# @entry = current_user.entry.build(entry_params)
		@entry.target_date = @entry.target_date || Date.today
		
		if @entry.user_id == "" || @entry.user_id == 'null'
			redirect_to login_path
		elsif @entry.todo != ''
			if @entry.save
				redirect_to :action => 'index'
			else 
				render :new
			end
		end
		
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
		resource.update(entry_params)
		redirect_to :action => 'index'

		# @entry = Entry.find(params[:id])
		# # @entry.toggle! :completed

		# @entries = all

		# render action: "index"

		# if @entry.update_attribute(:completed, true)
		# 	redirect_to entries_path, :notice => "Your To-Do item was marked as done!"
		# else
		# 	redirect_to entries_path, :notice => "Your To-Do item was unable to be marked as done!"
		# end

	end

	def typekit_include_tag(apikey)
	  javascript_include_tag("//use.typekit.com/#{apikey}.js") +
	  javascript_tag("try{Typekit.load()}catch(e){}")
	end

	private 

		def all
			Entry.all
		end

		def resource
		  Entry.find(params[:id])
		end

		def entry_params
			params.require(:entry).permit(:todo, :completed, :target_date, :user_id)
		end

end
