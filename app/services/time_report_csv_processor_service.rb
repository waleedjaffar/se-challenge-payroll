require 'csv'

class TimeReportCsvProcessorService

  def initialize(csv_file_data)
    @csv_file_data = csv_file_data
  end

  def call

    time_reports = []
    report_id = nil

    CSV.parse(@csv_file_data, :col_sep => ",", :headers => true).each do |row|
      if row[0] == 'report id'
        report_id = row[1]
      else
        time_reports << { date: row[0], hours_worked: row[1], employee_id: row[2], job_group: row[3] }
      end
    end

    # 0 - report_id already exists
    # 1 - report_id added successfully
    # 2 - exception occured while processing report_id
    # 3 - either report_id or data rows are missing
    status_messages = {
      0 => "Report already processed. Re-submit is not allowed",
      1 => "csv file process successfull",
      2 => "Error occured while processing report",
      3 => "Either report_id or data rows are missing"
    }

    status = 1
    if report_id.present? && time_reports.present?
      if TimeReport.exists?(report_id: report_id)
        status = 0
      else
        time_reports.each { |time_report| time_report[:report_id] = report_id }
        begin
          TimeReport.transaction do
            TimeReport.create!(time_reports)
          end
        rescue Exception
          status = 2
        end
      end
    else
      status = 3
    end

    return status, status_messages[status]
  end
end

