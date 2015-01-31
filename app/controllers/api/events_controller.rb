module Api
  class EventsController < ApiController
    def show
      @event = Event.find(params[:id])
    end

    def index
      @events = Event.all
    end

    def next_event
      logger = Logger.new(STDOUT)

      t = Time.now
      wday = t.wday
      if wday == 0
        wday = 6
      else
        wday = wday-1
      end

      @event = get_next_event(wday)
    end

    def get_next_event(wday)
      @events = Event.where(:dayofweek => wday)
      t = Time.now

      for i in 0..@events.count
        event = @events[i]
        next_event = @events[i+1]
        if(next_event == nil)
          return event
        end
        event_time_plus = Time.local(t.year, t.month,t.day, event.time.hour +  1, event.time.min, event.time.sec)
        next_event_time = Time.local(t.year, t.month,t.day, next_event.time.hour, next_event.time.min, next_event.time.sec)

        if t <= event_time_plus && t < next_event_time
          return event
        end
      end
    end
  end
end
