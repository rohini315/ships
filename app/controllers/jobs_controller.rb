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

    # redirect_to vs render
    # redirect_to -> goes to route and controller go the whatever page your path is
    # render -> doen't go to route it 
    # just renerate the template
    # error message will show up
    # flash message can show whether you use render ro redirect
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
