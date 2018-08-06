class JobGroupsController < ApplicationController
  before_action :set_job_group, only: [:show]

  # GET /job_groups
  # GET /job_groups.json
  def index
    @job_groups = JobGroup.all
  end

  # GET /job_groups/1
  # GET /job_groups/1.json
  def show
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_job_group
      @job_group = JobGroup.find(params[:id])
    end
end
