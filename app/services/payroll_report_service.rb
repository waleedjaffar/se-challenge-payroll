class PayrollReportService

  def call

    job_group_map = JobGroup.all.map do |job_group|
      [job_group[:name], job_group[:hour_rate]]
    end.to_h

    reports_map = {}

    time_reports = TimeReport.all.order(:employee_id, :date)
    time_reports.each do |time_report|

      pay_period = determine_pay_period(time_report.date)
      key = "#{time_report.employee_id}:#{pay_period}"
      amount_paid = 0.0

      if reports_map.has_key?(key)
        amount_paid = reports_map[key][:amount_paid] + calculate_amount(time_report.hours_worked, job_group_map[time_report.job_group])
      else
        amount_paid = calculate_amount(time_report.hours_worked, job_group_map[time_report.job_group])
      end

      reports_map[key] = {employee_id: time_report.employee_id, pay_period: pay_period, amount_paid: amount_paid}
    end

    reports_map.values
  end

  private

    def determine_pay_period(pay_date)
    beginning_of_month = pay_date.at_beginning_of_month
    if pay_date.day < 16
      "#{format_date(beginning_of_month)} - #{format_date(beginning_of_month + 14.days)}"
    else
      "#{format_date(beginning_of_month + 15.days)} - #{format_date(beginning_of_month.end_of_month)}"
    end
  end

  def format_date(date)
    date.strftime('%-d/%-m/%Y')
  end

  def calculate_amount(hours, rate)
    hours.to_f * rate.to_f
  end
end
