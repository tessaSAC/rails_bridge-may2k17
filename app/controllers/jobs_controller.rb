class JobsController < ApplicationController # JobsController should inherit from ApplicationController
	def index
		@jobs = Job.all
	end

	def new
		# model is automatically available; no need to import.
		@job = Job.new # new instance of `models/job.rb` model
		# now it can be accessed by the view
		# `@` denotes that this variable will be used in the view
	end

	def create
		Job.create(job_params)
		# render :index # normally would render `create` template by default
		# NOTE: This doesn't redirect, instead:
		redirect_to jobs_path
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		job = Job.find(params[:id]) # no `@` needed bc not using in view
		job.update_attributes(job_params) # equivalent to `job.update_attributes job_params`
		redirect_to jobs_path
	end

	def destroy
		job = Job.find(params[:id]) # no `@` needed bc not using in view
		job.destroy # equivalent to `job.destroy()`
		redirect_to jobs_path
	end

	private

	def job_params
	  params.require(:job).permit(:title, :description) # colon means it's looking for a SYMBOL in the hash
	end

end
