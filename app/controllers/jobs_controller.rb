class JobsController < ApplicationController
  def new
    @boat = Boat.find(params[:boat_id])
    @job = Job.new
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @job = Job.new(job_params)
    @job.boat_id = params[:boat_id]
   
    if @job.save
      redirect_to boat_path(@job.boat_id)
    else
      render '/jobs/new'
    end
  end

  def update
  end

  def show
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to :back
  end


  private

  def job_params
    params.require(:job).permit(:name,:container,:cargo, :origin,:cost, :dest)
  end
end
