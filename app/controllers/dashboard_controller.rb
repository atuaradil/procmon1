class DashboardController < ApplicationController
helper_method :sort_column, :sort_direction, :filter_text, :filter_column

  # GET
  def index

    @processes = Dashboard.get_processes(sort_column, sort_direction, filter_column, filter_text)
    
  end

  # POST
  def kill
  	pid = params[:pid]
  	Dashboard.kill(pid)

  	respond_to do |format|
  		format.html { redirect_to dashboard_index_path, 
  			notice: "Process ID #{pid} was successfully killed." }
  	end
  end

  private

  def sort_column
    params[:sort] ? params[:sort] : "pid"
  end

  def sort_direction
    params[:direction] ? params[:direction] : "asc"
  end

  def filter_column
    params[:filter_column]
  end

  def filter_text
    if params[:filter] && params[:filter].chomp == ""
      return nil
    end

    return params[:filter]
  end


end
