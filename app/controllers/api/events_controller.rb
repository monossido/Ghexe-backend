module Api
  class EventsController < ApplicationController
    respond_to :json
    
    def show
      @event = Event.find(params[:id])
    end

    def index
      @events = Event.all
    end
  end
end
