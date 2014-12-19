module Api
<<<<<<< HEAD
  class EventsController < ApiController

=======
  class EventsController < ApplicationController
    respond_to :json
    
>>>>>>> 7cc049fc30505611072b7afce4fce3e7abb85011
    def show
      @event = Event.find(params[:id])
    end

    def index
      @events = Event.all
    end
  end
end
