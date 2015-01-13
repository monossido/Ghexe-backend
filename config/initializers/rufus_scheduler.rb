require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '1 0 * * *' do
  Scheduler.gcm_cron
end
