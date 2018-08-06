class TimeReportsController < ApplicationController

  # GET /time_reports
  # GET /time_reports.json
  def index
  end

  def csv_upload
    csv_file = params[:csv_file]

    respond_to do |format|
      format.html {
        if csv_file.blank?
            flash[:error] = "csv file not uploaded"
            render :index
        else
          csv_file_data = csv_file.read
          if csv_file_data.blank?
            flash[:error] = "csv file doesn't have any data"
            render :index
          else
            status, message = TimeReportCsvProcessorService.new(csv_file_data).call
            if status == 1
              flash[:notice] = message
              redirect_to payroll_reports_url
            else
              flash[:error] = message
              render :index
            end
          end
        end
      }
      format.json {
        if csv_file.blank?
          render json: "csv file not uploaded", status: 400
        else
          csv_file_data = csv_file.read
          if csv_file_data.blank?
            render json: "csv file doesn't have any data", status: 400
          else
            status, message = TimeReportCsvProcessorService.new(csv_file_data).call
            if status == 1
              render json: message, status: 201
            else
              render json: message, status: (status == 2 ? 500 : 400)
            end
          end
        end
      }
    end
  end
end
