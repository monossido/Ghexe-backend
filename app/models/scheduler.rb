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
        schedule_time = t.strftime("%Y/%m/%d") + ' ' + event.time.strftime("%H:%M:%S")
        scheduler.at schedule_time do
          gcm(event.id)
        end
      end
    end
  end

  def self.gcm(event_id)
    @presences = Presence.where(:event_id => event_id)
    gcm = GCM.new("AIzaSyCil8ZKsw_7vzSZNq2lI2xk8Id6tKIWFnE")
    # you can set option parameters in here
    #  - all options are pass to HTTParty method arguments
    #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L40-L68
    #  gcm = GCM.new("my_api_key", timeout: 3)

    @presences.each do |presence|
      registration_ids = [presence.user.gcm]
      options = {data: {event_title: presence.event.title, presence: presence.presence, presence_id: presence.id}}
      response = gcm.send(registration_ids, options)
    end
  end
end
