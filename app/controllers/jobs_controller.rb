class JobsController < ApplicationController
  def new
    puts "PARAMS : "+params.inspect
    @boat = Boat.find(params[:boat_id])
    @job = Job.new
  end

  def create


    puts "PARAMS C: "+ params.inspect
    @job = Job.create(job_params)
     
   
    if @job.save
     redirect_to boat_path(@job.boat_id)
    else
      render :back
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
    params.require(:job).permit(:name,:container,:cargo, :origin,:cost, :dest, :boat_id)
  end


end
