class Scheduler
  def self.gcm_cron
    scheduler = Rufus::Scheduler.new
    logger = Logger.new(STDOUT)

    t = Time.now
    wday = t.wday
    if wday == 0
      wday = 6
    else
      wday = wday-1
    end

    @events = Event.where(:dayofweek => wday)
    @events.each do |event|
      event_time = Time.local(t.year, t.month,t.day, event.time.hour, event.time.min, event.time.sec)
      if event_time > t
        event_time = event_time - 1 * 60 * 60 #starts 1 hour before
        scheduler.at event_time do
          send_gcm(event.id)
        end
      end
    end
    sleep(23*60*60) #force the process to stay up, needed for rufus scheduler
  end

  def self.send_gcm(event_id)
    logger = Logger.new(STDOUT)
    logger.debug 'send_gcm_onReminder'
    @presences = Presence.where(:event_id => event_id)

    @presences.each do |presence|        destination = [presence.user.gcm]
      data = {:type => 'onReminder', :event_title => presence.event.title, :presence => presence.presence, :presence_id => presence.id}
      GCM.send_notification( destination, data )
    end
  end
end
