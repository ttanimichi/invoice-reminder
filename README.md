# Invoice Reminder

The best way to remember to send invoices at the last business day of the month.

See also: https://zenn.dev/ttanimichi/articles/7a0877a771b6c3

## Usage

You need to install Ruby at first. And, then:

```
$ bundle install
$ bundle ex ruby main.rb
```

## Environment variables

You need to set Slack's WEBHOOK_URL as the value of an environment variable `INVOICE_REMINDER_WEBHOOK_URL`

```
$ cat /etc/environment | grep INVOICE_REMINDER_WEBHOOK_URL
INVOICE_REMINDER_WEBHOOK_URL="https://hooks.slack.com/services/xxx/xxx/xxx"
```

To get the Slack's WEBHOOK_URL you need:

1. go to https://slack.com/apps/A0F7XDUAZ-incoming-webhooks
2. choose your team, press configure
3. in configurations press add configuration
4. choose channel, press "Add Incoming WebHooks integration"

## My cron config

```
$ crontab -l

MAILTO=""
45 11 * * * /usr/bin/ruby /home/ubuntu/invoice_reminder/main.rb
```

## Tests

```
$ bundle ex rspec ./spec.rb
```
