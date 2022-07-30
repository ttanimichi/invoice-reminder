require "active_support"
require 'active_support/all'
require 'slack-notifier'
require 'holiday_jp'

BUSINESS_DAYS = {
  Sunday: false,
  Monday: true,
  Tuesday: true,
  Wednesday: true,
  Thursday: false,
  Friday: false,
  Saturday: false,
}

def business_days_of_month(today: Date.today)
  business_days = BUSINESS_DAYS.select { _2 }.keys

  (today.beginning_of_month..today.end_of_month).select {
    _1.strftime("%A").to_sym.in? business_days
  }.reject {
    HolidayJp.holiday? _1
  }
end

if __FILE__ == $0
  if business_days_of_month.first.today?
    notifier = Slack::Notifier.new ENV["INVOICE_REMINDER_WEBHOOK_URL"]
    notifier.ping "今日は月初の営業日です。請求書を提出しましょう！"
  end
end
