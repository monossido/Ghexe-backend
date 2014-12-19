module Api
  class EventsController < ApiController
    def show
      @event = Event.find(params[:id])
    end

    def index
      @events = Event.all
    end
  end
end
