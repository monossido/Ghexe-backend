module Api
  class PresencesController < ApiController
    def create
      @presence = Presence.new(presence_params)

      if @presence.save
        render :show, status: :created
      else
        render json: @presence.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @presence = Presence.find(params[:id])
      @presence.destroy

      head :no_content
    end

    def show
      @presence = Presence.find(params[:id])
    end

    def index
      @presences = Presence.all
    end

    def update
      @presence = Presence.find(params[:id])

      if @presence.user.id == current_resource_owner.id
        if @presence.update(presence_params)
          send_gcm(@presence.id)
          render :show, status: :created
        else
          render json: @presence.errors, status: :unprocessable_entity
        end
      else
        render json: "error:true"
      end
    end

    def send_gcm(presence_id)
      presence = Presence.find(presence_id)

      t = Time.now
      wday = t.wday
      if wday == 0
        wday = 6
      else
        wday = wday-1
      end

      event = presence.event
      if event.dayofweek == wday && t.hour + 2 >= event.time.hour && t.hour <= event.time.hour
        logger.debug 'send_gcm_onUserChange'
        destination = []
        User.all.each do |user|
          if user.id != presence.user.id
            destination.push(user.gcm)
          end
        end
        data = {:type => 'onUserChanged', :event_title => presence.event.title, :presence => presence.presence, :presence_id => presence.id, :user => presence.user.first_name + " " + presence.user.second_name}
        GCM.send_notification( destination, data )
      end
    end

    private
    def presence_params
      params.require(:presence).permit(:presence, :user_id, :event_id)
    end
  end
end
