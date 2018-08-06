class TimeReportsController < ApplicationController
  before_action :set_time_report, only: [:show, :edit, :update, :destroy]

  # GET /time_reports
  # GET /time_reports.json
  def index
    @time_reports = TimeReport.all
  end

  # GET /time_reports/1
  # GET /time_reports/1.json
  def show
  end

  # GET /time_reports/new
  def new
    @time_report = TimeReport.new
  end

  # GET /time_reports/1/edit
  def edit
  end

  # POST /time_reports
  # POST /time_reports.json
  def create
    @time_report = TimeReport.new(time_report_params)

    respond_to do |format|
      if @time_report.save
        format.html { redirect_to @time_report, notice: 'Time report was successfully created.' }
        format.json { render :show, status: :created, location: @time_report }
      else
        format.html { render :new }
        format.json { render json: @time_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_reports/1
  # PATCH/PUT /time_reports/1.json
  def update
    respond_to do |format|
      if @time_report.update(time_report_params)
        format.html { redirect_to @time_report, notice: 'Time report was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_report }
      else
        format.html { render :edit }
        format.json { render json: @time_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_reports/1
  # DELETE /time_reports/1.json
  def destroy
    @time_report.destroy
    respond_to do |format|
      format.html { redirect_to time_reports_url, notice: 'Time report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_report
      @time_report = TimeReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_report_params
      params.require(:time_report).permit(:report_id, :date, :hours_worked, :employee_id, :job_group)
    end
end
