class PayrollReportsController < ApplicationController

  # GET /payroll_reports
  # GET /payroll_reports.json
  def index
    @payroll_reports = PayrollReportService.new.call
  end
end
