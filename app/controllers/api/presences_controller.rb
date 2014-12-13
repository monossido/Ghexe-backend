module Api
  class PresencesController < ApplicationController

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

      if @Presence.update(presence_params)
        render :show, status: :created
      else
        render json: @presence.errors, status: :unprocessable_entity
      end
    end

    private
    def presence_params
      params.require(:presence).permit(:presence, :user_id, :event_id)
    end
  end
end
