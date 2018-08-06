json.employee_id payroll_report[:employee_id]
json.pay_period payroll_report[:pay_period]
json.amount_paid number_to_currency(payroll_report[:amount_paid])
